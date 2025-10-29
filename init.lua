require("user.keymaps")
require("user.opt")
-- Lazy startup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
    "git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

vim.cmd([[
  try
    colorscheme desert
    set background=dark
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

vim.api.nvim_create_autocmd({ 'UiEnter', 'ColorScheme' }, {
  callback = function()
    -- 1.
    vim.cmd[[
      hi TabLineFill gui=nocombine
      hi WinBar gui=nocombine
    ]]
    -- 2.
    vim.cmd[[
      hi TabLineFill guibg=none
      hi WinBar gui=none
    ]]
    -- 3.
    vim.cmd[[
      hi! link TabLineFill Normal
      hi! link WinBar Normal
    ]]
  end
})
