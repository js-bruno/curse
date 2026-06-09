local keymaps = require 'user.keymaps'

return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    -- lspconfig só para servidores que precisam de config extra
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.enable('nixd')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('gopls')
      -- vim.lsp.enable('volar')

      -- html precisa de config extra
      vim.lsp.config('html', {
        capabilities = capabilities,
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = { css = true, javascript = true },
          provideFormatter = true,
        },
      })
      vim.lsp.enable('html')

      -- pylsp precisa de settings
      vim.lsp.config('pylsp', {
        settings = {
          pylsp = {
            plugins = {
              mypy = { enabled = false },
              pycodestyle = {
                ignore = { 'W391' },
                maxLineLength = 100,
              },
            },
          },
        },
      })
      vim.lsp.enable('pylsp')

      vim.o.winborder = 'double'

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          keymaps.declareLPSKeymaps()
        end,
      })
    end,
  },
}
