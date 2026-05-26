return {
    {
        "igorlfs/nvim-dap-view",
        ---@module 'dap-view'
        ---@type dapview.Config
        opts = {},
      config = function ()
        vim.keymap.set( "n", "<leader>dv", ":DapViewToggle<cr>")
      end
    },
}
