return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = vim.g.mason_packages.fmt,
			format_on_save = {
				-- timeout_ms = 500,
				lsp_format = "fallback",
			},
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end, { desc = "[F]ormat Buffer" }),
		})
	end,
}
