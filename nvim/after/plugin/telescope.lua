require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

require("telescope").load_extension("ui-select")

vim.cmd('highlight TelescopePromptBorder guifg=#9ccfd8 guibg=none')
vim.cmd('highlight TelescopeBorder guifg=#9ccfd8 guibg=none')
vim.cmd('highlight TelescopeSelection guifg=#9ccfd8 guibg=none')
