return { "anuvyklack/windows.nvim",
   dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
   },
   config = function()
      vim.o.winwidth = 50
      vim.o.winminwidth = 10
      vim.o.equalalways = true
    require('windows').setup()
    -- vim.keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
    -- vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
    -- vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
    -- vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')
   end
}
