return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            ensure_installed = {
                'c',
                'lua',
                'rust',
                'lua',
                'vim',
                'vimdoc',
                'query',
                'javascript',
                'typescript',
                'bash',
                'jsdoc',
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
