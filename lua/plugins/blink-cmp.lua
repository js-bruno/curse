return {
  'saghen/blink.cmp',
  -- dependencies = 'rafamadriz/friendly-snippets',
  dependencies = {
    'L3MON4D3/LuaSnip',
    "rafamadriz/friendly-snippets",
  },
  signature = { enabled = true },
  version = '*',
  ---
  ---@module 'blink.cmp'cmp
  ---@type blink.cmp.Config
  opts = {
    completion = {
      ghost_text = {enabled = true },
      menu = {
        auto_show = false
      },
    },
    keymap = {
      preset = 'super-tab',
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
    },
    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        path = {
          opts = { get_cwd = vim.uv.cwd },
        },
        luasnip = {
          name = "luasnip",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          score_offset = 950
        },
        snippets = {
          opts = {
            search_paths = { "~/.config/nvim/lua/snippets/" },
          },
        }
        -- buffer = {
        --   fallback_for = {}, -- disable being fallback for LSP
        --   max_items = 4,
        --   min_keyword_length = 4,
        --   score_offset = -3,
        -- },
      }
    },
  },

  opts_extend = { "sources.default" }
}
