# redvim

Uma configuração de neovim pequena, enxuta e "soviética" 🤝

> **NOTA:** este repo é o **wiki** da config. Para instalar, ver [README](https://github.com/js-bruno/nvim-config).

## Stack

| Camada | Escolha | Papel |
|--------|---------|-------|
| Gerenciador de plugins | **lazy.nvim** | lazy-load de tudo |
| Tema | **solarized-osaka** (transparent) | cores + `on_highlights` custom |
| Fonte (terminal) | **Maple Mono NF** | código, Nerd Font p/ ícones |
| Fonte (itálico) | **Victor Mono** Medium Italic | keywords/tipos em itálico |
| Requisito | **Neovim** >= 0.10.1 | `nim.version` mínimo |

## Estrutura

```
init.lua
lua/
├── plugins/        # 1 arquivo por plugin (lazy.nvim)
└── user/
    ├── opt.lua     # options (tabs=2, rnu, clipboard, …)
    └── keymaps.lua # mapas globais
```

Detalhes de cada plugin e os keymaps: **[Stack.md](Stack.md)**