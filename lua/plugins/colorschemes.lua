return {
{
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
  },
  {
    "tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
  },
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
	},
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		priority = 1000,
	},
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
  },
	{
		"lunarvim/darkplus.nvim",
		name = "darkplus",
		priority = 1000,
	},
	{
		"EtiamNullam/white-chocolate.nvim",
		tag = "v1.1.0",
		config = function()
			require("white-chocolate").setup()
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			require("onedarkpro").setup({
				colors = {
					-- onedark = { bg = "#1e1e1e" },
				},
				styles = { -- For example, to apply bold and italic, use "bold,italic"
					types = "NONE", -- Style that is applied to types
					methods = "NONE", -- Style that is applied to methods
					numbers = "NONE", -- Style that is applied to numbers
					strings = "NONE", -- Style that is applied to strings
					comments = "NONE", -- Style that is applied to comments
					keywords = "italic", -- Style that is applied to keywords
					constants = "bold", -- Style that is applied to constants
					functions = "bold,italic", -- Style that is applied to functions
					operators = "NONE", -- Style that is applied to operators
					variables = "NONE", -- Style that is applied to variables
					parameters = "italic", -- Style that is applied to parameters
					conditionals = "NONE", -- Style that is applied to conditionals
					virtual_text = "NONE", -- Style that is applied to virtual text
				},
			})
		end,
	},
  {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
    config = function ()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end
  }
}
