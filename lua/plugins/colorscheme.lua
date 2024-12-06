local onedark = {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
        local onedark = require('onedark')
        onedark.setup({
            -- style = ''
        })
        onedark.load()
    end
}

local catppuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            transparent_background = false,
        })
        vim.cmd.colorscheme('catppuccin')
    end

}

return onedark
