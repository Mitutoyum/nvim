return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local tree = require('nvim-tree')
        local api = require('nvim-tree.api')
        tree.setup({
            disable_netrw = true,

            on_attach = api.config.mappings.default_on_attach,

            filters = {
                dotfiles = false
            },

            renderer = {
                root_folder_label = ':t',
            }
        })

        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, {desc = desc, })
        end

        map('<leader>tt', api.tree.toggle, '[T]ree [T]oggle')
        map('<leader>tf', api.tree.focus, '[T]ree [F]ocus')
    end,
}
