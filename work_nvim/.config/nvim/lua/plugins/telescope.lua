return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>dd", builtin.diagnostics, {})
			vim.keymap.set("n", "<leader>bb", builtin.buffers, {})

			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							preview_height = 0.6,
							width = 0.98,
							height = 0.98,
						},
					},
				},
			})
		end,
	},
}
