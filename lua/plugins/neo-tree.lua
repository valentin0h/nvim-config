return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>ts", ":Neotree action=focus reveal<CR>", { desc = "[T]ree [S]how" })
			vim.keymap.set("n", "<leader>tc", ":Neotree action=close<CR>", { desc = "[T]ree [C]lose" })
			vim.keymap.set("n", "<leader>tf", ":Neotree action=focus float<CR>", { desc = "[T]ree Show [F]loat" })

			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					width = 60,
					position = "right",
				},
			})
		end,
	},
}
