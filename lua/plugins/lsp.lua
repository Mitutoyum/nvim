return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    config = function()
        local lsp = { -- add more as you wish
            'lua_ls',
            'pyright'
        }
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('LspConfig', {}),
            callback = function(event)
                local builtin = require('telescope.builtin')
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, {desc = desc, buffer = event.buffer})
                end

                map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
                map('gr', builtin.lsp_references, '[G]oto [R]eference')
                map('gi', builtin.lsp_implementations, '[G]oto [I]mplementation')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            end
        })

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = lsp
        })


        local lspconfig = require('lspconfig')
        for _, ls in ipairs(lsp) do
            local opts = {capabilities = capabilities}
            if ls == 'lua_ls' then
                opts['settings'] = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            end

            lspconfig[ls].setup(opts)
        end
    end
}
