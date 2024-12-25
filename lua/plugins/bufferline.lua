return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
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
		})
	end,
}
