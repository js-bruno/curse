return {
    {
        "igorlfs/nvim-dap-view",
        opts = {},
      config = function ()
        vim.keymap.set( "n", "<leader>dv", ":DapViewToggle<cr>")
      end
    },
}
