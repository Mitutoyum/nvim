return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    config = function()
        local lsp = {
            'lua_ls',
            'pyright'
        }
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- vim.api.nvim_create_autocmd('LspAttach', {
        --
        -- })

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = lsp
        })


        local lspconfig = require('lspconfig')
        for _, ls in ipairs(lsp) do
            lspconfig[ls].setup({
                capabilities = capabilities
            })
        end
    end
}
