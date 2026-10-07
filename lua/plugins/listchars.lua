return {
  "fraso-dev/nvim-listchars",
  opts = true,
  event = "BufEnter",
  config = function()
    vim.keymap.set("n", "<space>z", ":ListcharsToggle<CR>", {})
    require("nvim-listchars").setup({
      save_state = false,
      listchars = {
        trail = "-",
        eol = "↲",
        tab = "» ",
        space = "·",
      },
      notifications = true,
      exclude_filetypes = {
        "markdown"
      },
      lighten_step = 10,
    })
  end

}
