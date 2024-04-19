return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			local lga_actions = require("telescope-live-grep-args.actions")

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
						n = {
							["d"] = "delete_buffer",
						},
					},
				},
				extensions = {
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-;>"] = lga_actions.quote_prompt(),
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
					},
				},
			})
			-- sort buffers by last used
			require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })

			require("telescope").load_extension("live_grep_args")

			local function telescope_live_grep_open_files()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end
			vim.keymap.set("n", "<leader>f/", telescope_live_grep_open_files, { desc = "[F]ind [/] in Open Files" })
			vim.keymap.set(
				"n",
				"<leader>fs",
				require("telescope.builtin").builtin,
				{ desc = "[S]earch [S]elect Telescope" }
			)
			vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Find [G]it [F]iles" })
			vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set(
				"n",
				"<leader>fw",
				require("telescope.builtin").grep_string,
				{ desc = "[S]earch current [W]ord" }
			)
			-- vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				require("telescope").extensions.live_grep_args.live_grep_args,
				{ desc = "[F]ind by [G]rep [A]rgs" }
			)
			vim.keymap.set("n", "<leader>fG", ":LiveGrepGitRoot<cr>", { desc = "[F]ind by [G]rep on Git Root" })
			vim.keymap.set(
				"n",
				"<leader>fd",
				require("telescope.builtin").diagnostics,
				{ desc = "[F]ind [D]iagnostics" }
			)
			vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "[F]ind [R]esume" })
		end,
	},
}
