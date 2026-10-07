# Fontes & Itálico — setup atual

Documentação da configuração de fontes (Kitty) e customização de itálico no
neovim (solarized-osaka). Atualizado em out/2026.

---

## 1. Fonte principal (Kitty)

**Combo atual:** código em **Maple Mono NF** + texto em itálico em **Victor Mono** (cursiva).

`~/.config/kitty/kitty.conf` (linhas 7–10 + `modify_font`):

```conf
font_family      family="Maple Mono NF"
bold_font        family="Maple Mono NF" style="Bold"
italic_font      family="Victor Mono" style="Medium Italic"
bold_italic_font family="Victor Mono" style="SemiBold Italic"
modify_font cell_height +10px
```

### Como trocar
- **Fonte de código:** trocar `font_family` + `bold_font` (tem que ser Nerd Font para os ícones).
- **Fonte do itálico (cursiva):** trocar `italic_font` + `bold_italic_font`. Pode ser uma família
  diferente da do código — o Kitty usa essa fonte só quando o texto estiver em itálico.
- **Grossura do itálico:** o Victor Mono tem pesos `Italic` (fino), `Medium Italic`,
  `SemiBold Italic`, `Bold Italic`. Ex.:
  - fino: `style="Italic"`
  - médio (padrão atual): `style="Medium Italic"`
  - grosso: `style="SemiBold Italic"` (usado no bold-itálico)

Depois de editar: recarregue o Kitty com `Ctrl+Shift+F5`.

---

## 2. Itálico no neovim (solarized-osaka)

`lua/plugins/colorschemes.lua` — bloco final do plugin `craftzdog/solarized-osaka.nvim`:

```lua
opts = {
  transparent = true,
  styles = {
    comments = { italic = false },      -- comentários SEM itálico
    keywords = { italic = true },       -- if/for/return… EM itálico
    functions = {},                     -- nomes/func em NORMAL
    variables = {},
  },
  on_highlights = function(highlights, colors)
    highlights["@keyword.function"]   = { fg = colors.green500,  italic = true } -- o "func"
    highlights["@type"]               = { fg = colors.yellow500, italic = true } -- int, string…
    highlights["@type.builtin"]       = { fg = colors.yellow500, italic = true }
    highlights["@variable.parameter"] = { fg = colors.orange500, italic = true } -- (a, b int)
  end,
},
```

Regra estética adotada: **itálico em tokens esparsos** (keywords, tipos, parâmetros,
o `func`) e **normal nos nomes de função** (azul). Funções em itálico poluem o código.

O tema já deixa `@comment` e `@keyword` em itálico por padrão.

> ⚠️ **Gotcha importante:** `vim.tbl_deep_extend` **ignora tabela vazia**.
> `comments = {}` **não** remove o `italic` que o tema aplica por padrão — para
> desligar um estilo é obrigatório `comments = { italic = false }`.

### Mapas de cores usados (palette solarized-osaka)
- `green500`  = `hsl(68,100,30)`  → `func`/keywords
- `yellow500` = `hsl(45,100,35)`  → tipos
- `orange500` = `hsl(18,80,44)`   → parâmetros
- funções = azul do tema (`Function`), sem itálico

---

## 3. Fontes instaladas no sistema

Diretório `~/.local/share/fonts/`:

| Pasta         | Família                          | Para quê                    |
|---------------|----------------------------------|-----------------------------|
| `MapleMono/`  | Maple Mono NF (Regular/Bold/Italic/BoldItalic) | fonte de código (atual) |
| `VictorMono/` | Victor Mono (all weights, TTF/OTF/WOFF2)      | itálico cursivo (atual)     |

Registradas via `fc-cache -f` (fontconfig já varre `~/.local/share/fonts`).
Outras Nerd Fonts já estão no nix store (IosevkaTerm, BlexMono, GoMono, EnvyCodeR,
Agave, ComicShannsMono…).

---

## 4. Preview das combinações (HTML)

Página gerada: `~/.config/nvim/fontpreview/index.html` (+ `fonts/`, ~133 MB).

```bash
xdg-open ~/.config/nvim/fontpreview/index.html   # abrir (Ctrl+Shift+R se ficar em cache)
```

- Simula o resultado real no neovim: funções em azul normal, itálico cursivo em
  comentários/keywords/`func`/tipos/parâmetros (Receita A).
- Contém o combo atual + combos propostos/bônus/novas versões de itálico.
- Marcador no título: `v2 · 21 combos` (novo sempre ao editar).

Base das fontes baixadas (referência p/ re-gerar o preview): zips no `~/tmp`,
fontes da Nerd Fonts v3.5.1, Google Fonts (Lekton), floor vb.

### Combinações disponíveis no preview
Propostos: JetBrainsMono▪Victor · CascadiaCode▪Maple · FiraCode▪Fantasque ·
GeistMono▪Maple · Maple Mono▪Victor
Bônus (já instaladas): BlexMono▪Victor · EnvyCodeR▪Victor · GoMono▪Maple · Agave▪Fantasque
Novos itálicos: SourceCodePro▪Hack · GeistMono▪UbuntuMono · FiraCode▪Monaspace ·
JetBrainsMono▪Cascadia · Maple▪SpaceMono · Cascadia▪Monoid · JetBrainsMono▪Lekton

---

## 5. Referência rápida

| Ação                                  | Onde / como                          |
|---------------------------------------|--------------------------------------|
| Trocar fonte de código                | `kitty.conf` → `font_family`/`bold_font` |
| Trocar fonte do itálico               | `kitty.conf` → `italic_font`/`bold_italic_font` |
| Itálico mais grosso/fino              | `style="SemiBold Italic"` / `style="Italic"` no `italic_font` |
| On/off itálico por grupo no neovim    | `colorschemes.lua` → `styles` + `on_highlights` |
| Desligar estilo com tabela vazia ✗    | usar `{ italic = false }` (não `{}`)  |
| Recarregar Kitty                      | `Ctrl+Shift+F5`                       |
| Recarregar tema no neovim             | `:colorscheme solarized-osaka`        |