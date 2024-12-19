return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local packages = {
			-- lsp
			"lua_ls",
			"pyright",
			"clangd",

			-- formatters
			"stylua",
			"ruff",
			"isort",
			"black",
		}

		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = packages,
		})
	end,
}
