# Plugins & Keymaps

Tudo que o [redvim](https://github.com/js-bruno/redvim) carrega — plugins (via [lazy.nvim](https://github.com/folke/lazy.nvim), 1 arquivo por plugin em `lua/plugins/`), options e keymaps.

- [Plugins por categoria](#plugins-por-categoria)
- [Plugins desativados](#plugins-desativados)
- [Options](#options)
- [Keymaps](#keymaps)

---

## Plugins por categoria

### Base & load

| Plugin | Função |
|--------|--------|
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | gerenciador de plugins (lazy-load) |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | syntax highlighting |
| [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim) | fundo transparente |
| [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons) | ícones |
| [fraso-dev/nvim-listchars](https://github.com/fraso-dev/nvim-listchars) | lista caracteres invisíveis (tab/space/eol) |

### Tema

| Plugin | Função |
|--------|--------|
| [craftzdog/solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim) | colorscheme transparent + `on_highlights` custom |
| [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | pinta códigos de cor (hex) no buffer |

> Estética (detalhe em `FONTES.md`): itálico em **keywords/tipos/parâmetros**; **sem** itálico em comentários e nomes de função.

### Editor & texto

| Plugin | Função |
|--------|--------|
| [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | fecha pares automaticamente |
| [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) | adicionar/trocar/remover surrounds |
| [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) | comentários |
| [m-demare/hlargs.nvim](https://github.com/m-demare/hlargs.nvim) | destaca argumentos de funções |
| [mcauley-penney/visual-whitespace.nvim](https://github.com/mcauley-penney/visual-whitespace.nvim) | mostra espaços em branco na seleção visual |
| [svban/YankAssassin.nvim](https://github.com/svban/YankAssassin.nvim) | yank não suja o registro `"` |
| [olrtg/nvim-emmet](https://github.com/olrtg/nvim-emmet) | emmet (HTML/CSS) |
| [chrisgrieser/nvim-scissors](https://github.com/chrisgrieser/nvim-scissors) | *tesoura* — editar/adicionar snippets |

### LSP, completion & diagnostics

| Plugin | Função |
|--------|--------|
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | clients LSP |
| [ray-x/go.nvim](https://github.com/ray-x/go.nvim) | tooling Go (gopls, fillstruct, iferr) |
| [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) | assinatura de função ao digitar |
| [whynothugo/lsp_lines.nvim](https://git.sr.ht/~whynothugo/lsp_lines.nvim) | diagnostic em linha (virtual) |
| [chrisgrieser/nvim-tiny-inline-diagnostic](https://github.com/chrisgrieser/nvim-tiny-inline-diagnostic) | diagnostic inline sutil |
| [Saghen/blink.cmp](https://github.com/Saghen/blink.cmp) | completion |
| [maxandron/goplements.nvim](https://github.com/maxandron/goplements.nvim) | lista implementações Go (overlay) |
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim) | painel de troubles/diagnósticos |

### Git

| Plugin | Função |
|--------|--------|
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | sinais no gutter + blame + quickfix |
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | git nativo (`:G`) |
| [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) | diff visual / navegador de arquivos git |

### Busca & navegação

| Plugin | Função |
|--------|--------|
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | find_files, live_grep, git status/branches |
| [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | busca/substituição global |
| [otavioschwanck/arrow.nvim](https://github.com/otavioschwanck/arrow.nvim) | atalhos para arquivos frequentes |
| [mistweaverco/bafa.nvim](https://github.com/mistweaverco/bafa.nvim) | lista/busca de buffers |

### Arquivos & tree

| Plugin | Função |
|--------|--------|
| [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | file explorer |
| [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim) | editar filesystem como buffer |
| [simrat39/outline.nvim](https://github.com/simrat39/outline.nvim) | outline de símbolos (funções, tipos…) |

### UI & janelas

| Plugin | Função |
|--------|--------|
| [utilyre/barbecue.nvim](https://github.com/utilyre/barbecue.nvim) | breadcrumbs no winbar |
| [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | folds (LSP-aware) |
| [crispgm/nvim-tabline](https://github.com/crispgm/nvim-tabline) | tabline de buffers |
| [anuvyklack/windows.nvim](https://github.com/anuvyklack/windows.nvim) | zoom/empilhar/equilibrar janelas |
| [anuvyklack/animation.nvim](https://github.com/anuvyklack/animation.nvim) | animações (dependência do windows) |

### Go, DAP, testes & dados

| Plugin | Função |
|--------|--------|
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | depurador DAP |
| [igorlfs/nvim-dap-view](https://github.com/igorlfs/nvim-dap-view) | UI do DAP em buffers |
| [vim-test/vim-test](https://github.com/vim-test/vim-test) | testes (`TestNearest` / `TestSuite` / `TestVisit`) |
| [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) | UI de banco de dados |

### Notes & preview

| Plugin | Função |
|--------|--------|
| [nvim-neorg/neorg](https://github.com/nvim-neorg/neorg) | notes / organização |
| [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) | dashboard de boas-vindas |
| [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | renderiza markdown no buffer |
| [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | preview markdown no navegador |

### Extras

| Plugin | Função |
|--------|--------|
| [folke/snacks.nvim](https://github.com/folke/snacks.nvim) | utilidades (notifications, pickers…) |
| [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | navega vim ↔ panes do tmux |
| [yorickpeterse/nvim-pqf](https://github.com/yorickpeterse/nvim-pqf) | melhorias no quickfix |
| [XXiaoA/atone.nvim](https://github.com/XXiaoA/atone.nvim) | `<leader><space>` → `:Atone` |

## Plugins desativados

Presentes no config, mas com `enabled = false`:

| Plugin | Função |
|--------|--------|
| [windwp/windline.nvim](https://github.com/windwp/windline.nvim) | statusline (substituída pela tabline) |
| [Eandrju/cellular-automaton.nvim](https://github.com/Eandrju/cellular-automaton.nvim) | efeito `make_it_rain` (desligado) |

---

## Options

Resumo de `lua/user/opt.lua`:

| Grupo | Valor |
|-------|-------|
| Indentação | `tabstop`/`shiftwidth`/`softtabstop = 2`, `expandtab` |
| Linhas | `relativenumber` + `number`, `signcolumn = yes`, `cursorline` |
| Cores / clipboard | `termguicolors`, `clipboard = unnamedplus` |
| Persistência | `undofile`, `swapfile = off` |
| Splits | `splitbelow` + `splitright` |
| Rolagem | `sidescrolloff = 12`, `scrolloff = 3` |
| Outros | `wrap = off`, `smartcase`, `smartindent`, `mouse = a` |

---

## Keymaps

Mapas globais de `lua/user/keymaps.lua`. Leader = `space`.

### Geral

| Atalho | Ação |
|--------|------|
| `jk` (insert) | `<Esc>` |
| `<leader>w` | salvar (`:w`) |
| `<leader>q` | fechar buffer (`:bd`) |
| `<c-q>` | `:q` |
| `<leader><space>` | `:Atone` |
| `J` | juntar linha de baixo mantendo cursor |
| `<leader>S` | substituir palavra sob o cursor |
| `<leader>p` (visual) | colar sem perder o yank |

### Tabs & janelas

| Atalho | Ação |
|--------|------|
| `<A-1>` … `<A-7>` | ir para a tab 1…7 |
| `<tab>` / `<s-tab>` | próxima / anterior tab |
| `<leader><tab>` | `:tabnew` |
| `<leader>v` | `:vsplit` |
| `<c-h/j/k/l>` | mover entre janelas |
| `<c-up/down/left/right>` | redimensionar janela |

### Git & busca

| Atalho | Ação |
|--------|------|
| `<leader>rr` | gitsigns blame da linha |
| `<leader>re` | gitsigns → quickfix (todos) |
| `<leader>kj` | Telescope git status |
| `<leader>kl` | Telescope git branches |
| `<leader>,` | GrugFar (buscar/substituir global) |
| `<leader>f` | Telescope find_files (dropdown) |
| `<c-t>` | Telescope live_grep |

### LSP & Go

| Atalho | Ação |
|--------|------|
| `gd` | ir à definição |
| `gD` | definição em nova tab |
| `gl` | vsplit + definição |
| `K` | hover (com borda) |
| `<space>bf` | formatar buffer |
| `[d` / `]d` | diagnóstico anterior / próximo |
| `<leader>o` | diagnostics → loclist |
| `<leader>lp` | `:LspStop` |
| `<leader>ss` | GoFillStruct |
| `<leader>sd` | GoIfErr |

### Testes & snippets

| Atalho | Ação |
|--------|------|
| `<leader>t` | TestNearest |
| `<leader>T` | TestSuite |
| `<leader>g` | TestVisit |
| `<leader>se` | editar snippet (scissors) |
| `<leader>sa` | adicionar snippet (scissors) |

---

*atualizado em out/2026*