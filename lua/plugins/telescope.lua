local keymaps = require "user.keymaps"
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
      keymaps.declareTelescopeKeymaps()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            ".git/.*",
            "node_modules/.*",
          }
        },
				pickers = {
					lsp_references = {
						show_line = false,
					},
					buffers = {
						layout_config = {
							center = {
								height = 0.6,
								preview_cutoff = 120,
								preview_width = 0.4,
								mirror = false,
								width = 0.9,
							},
						},
						mappings = {
							n = {
								["x"] = "delete_buffer",
							},
						},
					},
					find_files = {
						mappings = {
							n = {
								-- ["jk"] = "close",
							},
						},
						layout_config = {
							bottom_pane = {
							  height = 25,
							  preview_cutoff = 120,
							  prompt_position = "top"
							},
							center = {
							  height = 0.4,
							  preview_cutoff = 40,
							  prompt_position = "top",
							  width = 0.5
							},
							cursor = {
							  height = 0.9,
							  preview_cutoff = 40,
							  width = 0.8
							},
							horizontal = {
								height = 0.7,
								preview_cutoff = 120,
								preview_width = 0.7,
								prompt_position = "top",
								mirror = true,
								width = 0.9,
							},
							-- vertical = {
							--   height = 0.9,
							--   preview_cutoff = 40,
							--
							--   prompt_position = "bottom",
							--   width = 0.8
							-- }
						},
					},
					git_status = {
						-- mappings = {
						--   n = {
						--     ["jk"] = "close",
						--   },
						-- },
						layout_config = {
							-- bottom_pane = {
							--   height = 25,
							--   preview_cutoff = 120,
							--   prompt_position = "top"
							-- },
							-- center = {
							--   height = 0.4,
							--   preview_cutoff = 40,
							--   prompt_position = "top",
							--   width = 0.5
							-- },
							-- cursor = {
							--   height = 0.9,
							--   preview_cutoff = 40,
							--   width = 0.8
							-- },
							horizontal = {
								height = 0.7,
								preview_cutoff = 120,
								preview_width = 0.7,
								prompt_position = "top",
								mirror = true,
								width = 0.9,
							},
							-- vertical = {
							--   height = 0.9,
							--   preview_cutoff = 40,
							--
							--   prompt_position = "bottom",
							--   width = 0.8
							-- }
						},
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					hidden = true,
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
