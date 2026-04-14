return {
  "leath-dub/snipe.nvim",
  enabled=false,
  keys = {
    {"<leader>e", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
  },
  opts = {}
}
