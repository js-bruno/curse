return {
	"nvim-neorg/neorg",
	run = ":Neorg sync-parsers", -- This is the important bit!
  lazy = false,
  tag = "v7.0.0",
	config = function()
		-- vim.keymap.set("n", "<leader>nn", ":Neorg keybind norg core.dirman.new.note<cr>", {})
		vim.keymap.set("n", "<leader>ni", ":Neorg index<cr>", {})

		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							work = "~/notes/work",
							home = "~/notes/home",
						},
						default_workspace = "home",
					},
				},
				["core.concealer"] = {
					config = {
            icon_preset = "diamond"
						-- icons = {
						-- 	heading = {
						-- 		enabled = true,
						--
						-- 		level_1 = {
						-- 			enabled = true,
						-- 			icon = "◉",
						-- 		},
						-- 		level_2 = {
						-- 			enabled = true,
						-- 			icon = " ○",
						-- 		},
						-- 		level_3 = {
						-- 			enabled = true,
						-- 			icon = "  ●",
						-- 		},
						-- 		level_4 = {
						-- 			enabled = true,
						-- 			icon = "   ○",
						-- 		},
						-- 	},
						-- },
					},
				},
			},
		})
	end,
}
