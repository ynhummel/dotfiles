return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

			-- Java config
			vim.uv.os_setenv("JAVA_HOME", "/Users/yurihummel/.sdkman/candidates/java/21.0.8-tem")
			vim.lsp.config("jdtls", {
				runtimes = {
					{
						name = "JavaSE-11",
						path = "/Users/yurihummel/.sdkman/candidates/java/11.0.28-tem",
					},
					{
						name = "JavaSE-21",
						path = "/Users/yurihummel/.sdkman/candidates/java/21.0.8-tem",
					},
				},
			})

			-- Zig config
			vim.lsp.config("zls", {
				cmd = { "/Users/yurihummel/.zig/tools/zls" },
				filetypes = { "zig", "zon" },
				root_markers = { { "build.zig" }, ".git" },
			})
			vim.lsp.enable("zls")
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.zig", "*.zon" },
				callback = function(ev)
					vim.lsp.buf.code_action({
						context = { only = { "source.fixAll", "source.organizeImports" } },
						apply = true,
					})
				end,
			})

			vim.keymap.set("n", "<space>fd", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
		end,
	},
}
