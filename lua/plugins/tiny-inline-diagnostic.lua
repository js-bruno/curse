return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        vim.diagnostic.config({ virtual_text = false })
        vim.diagnostic.config({ virtual_lines = false })
      end,
    })

    local symbols = { Error = "", Info = "󰋼", Hint = "󰌵", Warn = "󰡾" }

    for name, icon in pairs(symbols) do
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
    end
    require("tiny-inline-diagnostic").setup({
      options = {
        multilines = {
          enabled = true,
        },
        add_messages = {
            display_count = true,
        },
      },
    })
  end,
}
