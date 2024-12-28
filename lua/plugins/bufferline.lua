return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					text_align = "left",
					highlight = "Directory",
				},
			},
			diagnostics = "nvim_lsp",
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		local map = vim.keymap.set

		map("n", "tn", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
		map("n", "tp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
	end,
}
