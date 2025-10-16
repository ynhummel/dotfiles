return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "vim", "vimdoc", "c", "lua", "html", "go", "gosum", "gomod", "ruby", "python", "make" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
