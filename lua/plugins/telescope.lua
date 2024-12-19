return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		telescope.load_extension("ui-select")

		local map = vim.keymap.set
		local builtin = require("telescope.builtin")
		map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" }) -- needs ripgrep
		map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
