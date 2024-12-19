return {
	"stevearc/conform.nvim",
	event = { "BufReadPre" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = function(bufnr)
					if conform.get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
			},

			format_on_save = {
				lsp_format = "fallback",
			},

			vim.keymap.set({ "n", "v" }, "mp", function()
				require("conform").format({
					lsp_format = "fallback",
					async = true,
				})
			end, { desc = "[M]ake [P]retty" }),
		})
	end,
}
