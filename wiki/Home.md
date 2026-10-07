# redvim

Uma configuração de **Neovim** pequena, dark e "soviética" — construída com [lazy.nvim](https://github.com/folke/lazy.nvim).

> Repos principal: [js-bruno/redvim](https://github.com/js-bruno/redvim) · Requisito: Neovim **>= 0.10.1**

## Stack (resumo)

| Camada | Escolha | Papel |
|--------|---------|-------|
| Manager | **lazy.nvim** | lazy-load de todos os plugins |
| Tema | **solarized-osaka** (*transparent*) | cores + `on_highlights` customizado |
| Font (código) | **Maple Mono NF** | fonte do terminal (Nerd Font p/ ícones) |
| Font (itálico) | **Victor Mono** Medium Italic | keywords/tipos/parâmetros em itálico |
| Completion | **blink.cmp** | autocomplete inteligente |
| Busca | **Telescope** | find_files, live_grep, git |
| LSP / Go | **nvim-lspconfig** + **go.nvim** | gopls, DAP integrado |

> Config de fontes e itálico detalhada em `FONTES.md` do repo principal.

## Estrutura do config

```
init.lua
lua/
├── plugins/        # 1 arquivo por plugin (lazy.nvim)
└── user/
    ├── opt.lua     # options (tabs=2, rnu, clipboard, split, …)
    └── keymaps.lua # mapas globais
```

Snippets custom em `lua/snippets/` (Go + Lua), editados com **scissors**.

## Índice

- [Stack.md → Plugins, options e keymaps (tudo)](Stack.md)
  - [Plugins por categoria](Stack.md#plugins-por-categoria)
  - [Keymaps](Stack.md#keymaps)
- *README do repo*: [js-bruno/redvim](https://github.com/js-bruno/redvim)

---
*atualizado em out/2026*