return {
    'williamboman/mason.nvim',
    dependencies = {
        'WhoIsSethDaniel/mason-tool-installer.nvim'
    },
    config = function()
        require('mason').setup()

        local packages = {
            ls = {
                'lua_ls',
                'pyright',
            },

            fmt = {
                lua = {'stylua'},
                python = {'isort', 'black'}
            },

            opt = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = {'vim'}
                            }
                        }
                    }
                }
            }

        }

        vim.g.mason_packages = packages

        -- merge them into a single table for installation

        local merge = {}

        table.move(packages.ls, 1, #packages.ls, #merge + 1, merge)

        for ft, fmt in pairs(packages.fmt) do
            table.move(fmt, 1, #fmt, #merge + 1, merge)
        end

        require('mason-tool-installer').setup({
            ensure_installed = merge
        })

    end
}
