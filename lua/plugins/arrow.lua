return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    -- or if using `mini.icons`
    -- { "echasnovski/mini.icons" },
  },
  opts = {
    show_icons = true,
    leader_key = 'e', -- Recommended to be a single key
    buffer_leader_key = 'm', -- Per Buffer Mappings

    mappings = {
      toggle = "<CR>" -- used as save if separate_save_and_remove is true
    }
  },
}
