vim.g.mapleader = " "
vim.opt.clipboard:append('unnamedplus')

local map = vim.api.nvim_set_keymap

map('n', '<leader>..', 'Ex', { noremap = true, silent = true })

-- Go to line number (Keybind: " ln")
map('n', '<leader>ln', [[
    <cmd>lua (function()
        local line = vim.fn.input('Go to line #: ')
        if line ~= '' then
            vim.api.nvim_win_set_cursor(0, { tonumber(line), 0 })
        end
    end)
    ()<CR>]], { noremap = true, silent = true })

-- Find word and go to it (Keybind: "Ctrl + f")
_G.searchWord = function()
    local word = vim.fn.input('Find word: ')
    if word ~= '' then
        vim.cmd('nohlsearch')
        vim.cmd('set ignorecase')

        vim.cmd('let @/ = \'' .. vim.fn.escape(word, "'\\") .. '\'')

        local oldpos = vim.fn.getpos('.')
        vim.cmd('normal! n')
        local newpos = vim.fn.getpos('.')

        if oldpos[2] == newpos[2] and oldpos[3] == newpos[3] then
            print('No matches found for: ' .. word)
        end

        vim.cmd('set noignorecase')

    end
end

map('n', '<C-f>', '<cmd>lua searchWord()<CR>', { noremap = true, silent = true })

