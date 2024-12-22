return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>mp",
			function()
				require("conform").format({ lsp_format = "fallback", async = true })
			end,
			mode = "",
			desc = "[M]ake [P]retty",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
		},

		format_on_save = {
			lsp_format = "fallback",
		},
	},
}
