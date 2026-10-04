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
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config('nixd', {
        capabilities = capabilities,
      })

      vim.lsp.config('html', {
        capabilities = capabilities,
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = { css = true, javascript = true },
          provideFormatter = true,
        },
      })

      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      })

      vim.lsp.enable('gopls')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('nixd')
      vim.lsp.enable('html')
      vim.lsp.enable('ts_ls')

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
