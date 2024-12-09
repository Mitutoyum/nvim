return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    config = function()
        local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require('lspconfig')

        vim.api.nvim_create_autocmd('LspAttach', {
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

        require('mason-lspconfig').setup({
            handlers = {
                function(ls)
                    local opts = vim.g.mason_packages.opt[ls] or {}

                    if not opts.capabilities then
                        opts.capabilities = default_capabilities
                    end

                    lspconfig[ls].setup(opts)
                end
            }
        })
    end
}
