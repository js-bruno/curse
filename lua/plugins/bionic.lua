return {
  'FluxxField/bionic-reading.nvim',
  enabled=false,
  config = function()
    require('bionic-reading').setup({
      -- determines if the file types below will be
      -- automatically highlighted on buffer open
      auto_highlight = true,
      -- the file types you want to highlight with
      -- the node types you would like to target
      -- using treesitter
      file_types = {
        ["text"] = "any",
        ["lua"] = {
            "comment",
        },
      },
      -- the highlighting styles applied as val to nvim_set_hl()
      -- Please see :help nvim_set_hl() to see vals that can be passed
      hl_group_value = {
        bold = true
      },
      -- Flag used to control if the user is prompted
      -- if BRToggle is called on a file type that is not
      -- explicitly defined above
      prompt_user = true,
      -- Enable or disable the use of treesitter
      treesitter = true,
      -- Flag used to control if highlighting is applied as
      -- you type
      update_in_insert_mode = true,
    })
  end,
}
