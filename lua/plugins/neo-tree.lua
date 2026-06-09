return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
        source_selector = {
            winbar = true,
            statusline = true
        },
        filesystem = {
          hijack_netrw_behavior = "disabled",
        }
    })
    -- vim.keymap.set('n', '<C-b>', ':Neotree toggle source=filesystem reveal=true position=right<CR>', {})
    vim.keymap.set('n', '<C-b>', ':Neotree toggle source=git_status reveal=true position=right<CR>', {})
  end
}
