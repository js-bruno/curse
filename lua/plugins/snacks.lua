return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = { enabled = false },
    explorer = { enabled = false },
    bigfile = { enabled = true },
    ---@class snacks.layout.Config
    ---@field show? boolean show the layout on creation (default: true)
    ---@field wins table<string, snacks.win> windows to include in the layout
    ---@field layout snacks.layout.Box layout definition
    ---@field fullscreen? boolean open in fullscreen
    ---@field hidden? string[] list of windows that will be excluded from the layout (but can be toggled)
    ---@field on_update? fun(layout: snacks.layout)
    ---@field on_update_pre? fun(layout: snacks.layout)
    ---@field on_close? fun(layout: snacks.layout)
    layout = {
      enabled = true,
      width = 0.6,
      height = 0.6,
      zindex = 50,
    },
    indent = {
      priority = 1,
      enabled = false, -- enable indent guides
      char = "│",
      only_scope = false, -- only show indent guides of the scope
      only_current = false, -- only show indent guides in the current window
      hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
      -- can be a list of hl groups to cycle through
      -- hl = {
      --     "SnacksIndent1",
      --     "SnacksIndent2",
      --     "SnacksIndent3",
      --     "SnacksIndent4",
      --     "SnacksIndent5",
      --     "SnacksIndent6",
      --     "SnacksIndent7",
      --     "SnacksIndent8",
      -- },
    },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {
      ---@class snacks.scroll.Config
      ---@field animate snacks.animate.Config|{}
      ---@field animate_repeat snacks.animate.Config|{}|{delay:number}
      animate = {
        duration = { step = 10, total = 200 },
        easing = "linear",
      },
      -- faster animation when repeating scroll after delay
      animate_repeat = {
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
        easing = "linear",
      },
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
      end,
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    bufdelete = { enabled = true },
  },
  keys = {
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    -- { "<leader><space>", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>sa", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>q", function() Snacks.bufdelete() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>Q", ":bd<cr>", desc = "Visual selection or word", mode = { "n", "x" } },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>cL", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
  }
}
