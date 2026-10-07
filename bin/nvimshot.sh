#!/usr/bin/env bash
# nvimshot — tira screenshots (PNG) do config redvim rodando código de exemplo.
# Uso: nvimshot [all|dashboard|go|completion|lua|telescope|diffview] [--light] [--out DIR] [--cols N] [--display :N]
set -uo pipefail

# ---------------------------------------------------------------- config
SCENES_DEFAULT="dashboard go completion lua telescope diffview"
OUT_DIR="${NVIMSHOT_OUT:-$HOME/.config/nvim/nvimshot/out}"
COLS="${NVIMSHOT_COLS:-88}"
DISPLAY_N="${NVIMSHOT_DISPLAY:-:99}"
BG_DARK="#002b36"
BG_LIGHT="#fdf6e3"
FG_DARK="#93a1a1"
FG_LIGHT="#586e75"
MODE="dark"
TTY_BIN=""
XVFB_PID=""
TTY_PID=""
DEMO_DIR=""

log()  { printf '\033[1;36m[nvimshot]\033[0m %s\n' "$*"; }
die()  { log "ERRO: $*" >&2; exit 1; }
have() { command -v "$1" >/dev/null 2>&1; }

# ------------------------------------------------------------------ args
scenes=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    all)            scenes=( $SCENES_DEFAULT );;
    dashboard|go|completion|lua|telescope|diffview) scenes+=( "$1" );;
    --light)        MODE="light";;
    --out)          shift; OUT_DIR="$1";;
    --cols)         shift; COLS="$1";;
    --display)      shift; DISPLAY_N="$1";;
    --list)         printf '%s\n' "$SCENES_DEFAULT"; exit 0;;
    -h|--help)      sed -n '2,5p' "$0"; exit 0;;
    *)              die "argumento desconhecido: $1 (use --list)" ;;
  esac
  shift
done
[[ ${#scenes[@]} -eq 0 ]] && scenes=( $SCENES_DEFAULT )
mkdir -p "$OUT_DIR"

# ---------------------------------------------------------- pre-flight
for t in Xvfb tmux nvim magick import; do have "$t" || die "faltou: $t";
done
for t in kitty alacritty wezterm; do
  if have "$t"; then TTY_BIN="$t"; break; fi
done
[[ -n "$TTY_BIN" ]] || die "nenhum terminal (kitty|alacritty|wezterm) instalado"
if [[ " ${scenes[*]} " == *" go "* || " ${scenes[*]} " == *" completion "* ]]; then
  have go || die "faltou: go (cenas go/completion)"; 
fi

# ------------------------------------------------------------- warm-up
if [[ "${NVIMSHOT_NO_WARMUP:-0}" != "1" ]]; then
  log "warm-up: lazy.nvim sync (headless)"
  nvim --headless "+Lazy! sync" +qa >/dev/null 2>&1 || log "warm-up ignorado (rede/offline?)"
fi

# ------------------------------------------------------------ demo files
DEMO_DIR="$(mktemp -d /tmp/nvimshot-demo.XXXXXX)"
log "demo em: $DEMO_DIR"
cat > "$DEMO_DIR/main.go" <<'EOF'
package main

import (
	"fmt"
	"sync"
	"time"
)

// fibonacci retorna o n-ésimo termo da sequência.
func fibonacci(n int) int {
	if n <= 1 {
		return n
	}
	return fibonacci(n-1) + fibonacci(n-2)
}

type worker struct {
	id   int
	jobs chan int
	wg   sync.WaitGroup
}

func (w *worker) run(done chan<- int) {
	defer close(done)
	fibonacci(w.id + 40)
}

func main() {
	defer fmt.Println("done")

	start := time.Now()

	for i := 0; i < 5; i++ {
		w := worker{id: i, jobs: make(chan int)}
		fmt.Printf("worker %d -> %v\n", i, w.id)
		_ = w
	}

	fmt.Println(time.Since(start))
}
EOF

cat > "$DEMO_DIR/demo.lua" <<'EOF'
local M = {}

--- @param items table<string, number>
--- @param total integer
function M.avg(items, total)
  if total <= 0 then
    error("total deve ser > 0")
  end
  local sum = 0
  for _, v in ipairs(items) do
    sum = sum + v
  end
  return sum / total
end

M.config = {
  enabled = true,
  lists = { "maple", "victor" },
  keys = { jk = "<Esc>" },
}

return M
EOF

git -C "$DEMO_DIR" init -q
git -C "$DEMO_DIR" add -A
git -C "$DEMO_DIR" -c user.name=nvimshot -c user.email=nvimshot@local commit -qm init
printf '\n// working tree change\n' >> "$DEMO_DIR/main.go"

# -------------------------------------------------------------- Xvfb
log "subindo Xvfb $DISPLAY_N"
Xvfb "$DISPLAY_N" -screen 0 1600x1000x24 -nolisten tcp >/dev/null 2>&1 &
XVFB_PID=$!
sleep 1.5

# ------------------------------------------------------------- kitty
TTY_CONF="$(mktemp /tmp/nvimshot-tty.XXXXXX)"
TTY_SOCK="/tmp/nvimshot-kitty.sock"
W=1600
H=1000

[[ "$MODE" == "light" ]] && BG="$BG_LIGHT" || BG="$BG_DARK"
[[ "$MODE" == "light" ]] && FG="$FG_LIGHT" || FG="$FG_DARK"
cat > "$TTY_CONF" <<EOF
font_family  Maple Mono NF
italic_font  Victor Mono
bold_italic_font Victor Mono
modify_font  cell_height +10px
font_size    16.0
background    $BG
foreground    $FG
background_opacity 1.0
window_padding_width 14
initial_window_width  $W
initial_window_height $H
EOF

log "terminal: $TTY_BIN (display $DISPLAY_N)"
case "$TTY_BIN" in
  kitty)
    DISPLAY="$DISPLAY_N" kitty --config "$TTY_CONF" --listen-on "unix:$TTY_SOCK" \
      tmux new -s nvimshot -d >/dev/null 2>&1 &
    TTY_PID=$!
    ;;
  alacritty)
    DISPLAY="$DISPLAY_N" alacritty -e tmux new -s nvimshot -d >/dev/null 2>&1 &
    TTY_PID=$!
    ;;
  wezterm)
    DISPLAY="$DISPLAY_N" wezterm start -- tmux new -s nvimshot -d >/dev/null 2>&1 &
    TTY_PID=$!
    ;;
esac
sleep 2.5

TMUX="tmux"
# garantia de sessão (socket padrão do tmux)
if ! tmux has -t nvimshot 2>/dev/null; then
  tmux new -s nvimshot -d 2>/dev/null || die "não consegui abrir tmux"
fi
tmux set -g status off 2>/dev/null
tmux set -g default-terminal tmux-256color 2>/dev/null

if [[ "$MODE" == "light" ]]; then
  NVIM_CMD="$DEMO_DIR/shot-light"
  printf '#!/bin/sh\nexec nvim -c "colorscheme solarized-osaka" -c "set background=light" "$@"\n' > "$NVIM_CMD"
  chmod +x "$NVIM_CMD"
else
  NVIM_CMD="nvim"
fi

cleanup() {
  log "teardown"
  [[ -n "$TTY_PID" ]] && kill "$TTY_PID" 2>/dev/null
  [[ -n "$XVFB_PID" ]] && kill "$XVFB_PID" 2>/dev/null
  unlink "$TTY_CONF" 2>/dev/null
  rm -rf "$DEMO_DIR" 2>/dev/null
}
trap cleanup EXIT INT TERM

serve() { cd "$DEMO_DIR"; "$NVIM_CMD" "$@"; }
send(){ tmux send-keys -t nvimshot "$@"; }

cap() { # cap <nome>
  sleep 0.6
  DISPLAY="$DISPLAY_N" import -window root "$OUT_DIR/$1.png" 2>/dev/null
  log "salvo: $OUT_DIR/$1.png"
}

shot() { # shot <nome> <delay>  — tempo de tela antes do cap, depois fecha nvim
  local name="$1" delay="$2"
  sleep "$delay"
  cap "$name"
  send Escape ':qa!' Enter
  sleep 0.5
}

demo() {
  send 'cd' "$DEMO_DIR" Enter
  sleep 0.4
}

# ------------------------------------------------------------- scenes
for s in "${scenes[@]}"; do
  log "cena: $s"
  demo
  case "$s" in
    dashboard)
      send "$NVIM_CMD" Enter
      shot "dashboard-$MODE" 4
      ;;
    go)
      send "$NVIM_CMD" main.go Enter
      sleep 6   # gopls aquece
      send gg
      cap "go-$MODE"
      send Escape ':qa!' Enter
      sleep 0.5
      ;;
    completion)
      send "$NVIM_CMD" main.go Enter
      sleep 6
      send G
      send 'o'
      sleep 0.4
      send 'fmt.'
      shot "completion-$MODE" 3
      ;;
    lua)
      send "$NVIM_CMD" demo.lua Enter
      sleep 2
      send gg
      cap "lua-$MODE"
      send Escape ':qa!' Enter
      sleep 0.5
      ;;
    telescope)
      send "$NVIM_CMD" Enter
      sleep 4
      send ' f'          # <leader>f = Space f -> telescope find_files
      shot "telescope-$MODE" 4
      ;;
    diffview)
      send "$NVIM_CMD" main.go Enter
      sleep 5
      send ':DiffviewOpen' Enter
      shot "diffview-$MODE" 4
      ;;
  esac
done

log "feito -> $OUT_DIR"
ls -1 "$OUT_DIR" | sed 's/^/  /'