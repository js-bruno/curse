# Plugins & Keymaps

## Plugins por categoria

| Categoria | Plugins |
|-----------|---------|
| LSP | `lsp-config`, `go.nvim` (gopls), `lsp-lines`, `lsp-signature`, `hlargs`, `tiny-inline-diagnostic`, `nvim-ufo` |
| Completion | `blink-cmp`, `autopairs`, `mini-icons`, `surround`, `comment` |
| Busca | `telescope` (find_files, live_grep, git_status, git_branches) |
| Git | `gitsigns`, `git-fugitive`, `diffview` |
| Arquivos | `neo-tree`, `oil`, `grug-far` (busca global), `tesoura` |
| UI | `windline`, `tabline`, `barbecue`, `snacks`, `trouble`, `outline` |
| Go / DAP | `go.nvim`, `dap`, `dap-view`, `vim-dadbod-ui`, `celular-automation` |
| Extra | `arrow`, `atone`, `bafa`, `neorg` (notes), `render-markdown`, `markdown-preview`, `treesitter`, `nvim-tmux-navigator`, `listchars`, `transparent` |

## Opções (`lua/user/opt.lua`)

- `tabstop`/`shiftwidth`/`softtabstop = 2`, `expandtab`
- `relativenumber` + `number`, `signcolumn = yes`, `cursorline`
- `termguicolors`, `clipboard = unnamedplus`, `undofile`, `wrap = off`
- `splitbelow` + `splitright`

## Keymaps (`lua/user/keymaps.lua`)

| Atalho | Ação |
|--------|------|
| `<space>` | leader |
| `<leader>w` / `<leader>q` | salvar / `:bd` fechar buffer |
| `<tab>` / `<s-tab>` | next / previous tab |
| `<leader>v` | `:vsplit` |
| `<leader><space>` | `:Atone` |
| `<leader>rr` | gitsigns blame da linha |
| `<leader>,` | GrugFar (buscar/substituir global) |
| `<leader>t` / `<leader>T` | TestNear/TestSuite |
| `<c-t>` | Telescope live_grep |
| `<leader>f` | Telescope find_files (dropdown) |
| `<leader>kj` / `<leader>kl` | git status / branches |
| `gd` / `gD` / `gl` / `<space>bf` | go-to def / def em tab / def em vsplit / format |
| `[d` / `]d` | diagnóstico anterior / próximo |
| `<leader>ss` / `<leader>sd` | GoFillStruct / GoIfErr |
| `jk` (insert) | ESC |
| `<c-d>` / `<c-u>` | centraliza o cursor após rolar |
| `J` / `K` (visual) | mover linha p/ baixo / cima |
| `<c-h/j/k/l>` | navegar entre janelas |
| `<c-up/down/left/right>` | redimensionar janelas |
| `<leader>S` | substituir palavra sob cursor |
| `<leader>se` / `<leader>sa` | editar / adicionar snippet (scissors) |