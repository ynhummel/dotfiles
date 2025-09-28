return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		-- opts = { transparent = true },
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			local onedark = require("onedark")
			onedark.setup({ style = "dark" })
		end,
	},
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		-- opts = { transparent = true },
	},
}
