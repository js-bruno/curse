return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>a", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },

  auto_width = {
    -- Dynamically resize window width to fit content
    enabled = true,
    -- Maximum width (columns or percent if relative_width)
    max_width = 220,
    -- Include symbol details in width calculation
    include_symbol_details = false,
  },
  opts = {
    -- Your setup opts here
  },
}
