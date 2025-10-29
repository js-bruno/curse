local keymaps = require 'user.keymaps'
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
          css = true,
          javascript = true
        },
        provideFormatter = true
      }
      vim.lsp.enable('nixd')
      require("lspconfig").lua_ls.setup {}
      require("lspconfig").gopls.setup {}
      require("lspconfig").html.setup {
        capabilities = capabilities,
        init_options = init_options
      }

      -- require("lspconfig").ts_ls.setup {
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   init_options = {
      --     plugins = { -- I think this was my breakthrough that made it work
      --       {
      --         name = "@vue/typescript-plugin",
      --         location = "/usr/local/lib/node_modules/@vue/language-server",
      --         languages = { "vue" },
      --       },
      --     },
      --   },
      --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      -- }

      require("lspconfig").volar.setup {}
      require 'lspconfig'.pylsp.setup {
        settings = {
          pylsp = {
            plugins = {
              mypy = {
                enabled= false,
              },
              pycodestyle = {
                ignore = { 'W391' },
                maxLineLength = 100
              }
            }
          }
        }
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          keymaps.declareLPSKeymaps()
        end
      })
    end,
  },
}
