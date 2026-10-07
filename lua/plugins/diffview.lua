-- Packer
return {
  "sindrets/diffview.nvim",
  config = function ()
    vim.keymap.set("n", "<leader>df", ":DiffviewOpen<CR>", {})
    vim.keymap.set("n", "<leader>dd", ":DiffviewFileHistory<CR>", {})
  end
}
