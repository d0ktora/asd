local neoterm = require('neoterm')

neoterm.setup({
	clear_on_run = true, -- run clear command before user specified commands
	position = 'right',   -- vertical/horizontal/fullscreen
	noinsert = false     -- disable entering insert mode when opening the neoterm window
})

vim.cmd [[nnoremap <leader>tt <cmd>NeotermToggle<CR>]]

local function get_file_extension()
    local current_buffer = vim.api.nvim_get_current_buf()
    local file_name = vim.api.nvim_buf_get_name(current_buffer)
    return file_name:match("^.+%.(.+)$")
end

local running = false
local function execute_command_based_on_extension()
    local extension = get_file_extension()
    if running == true then
        running = false
        neoterm.exit()
        return
    end
    if extension == "cs" then
        neoterm.open({ position = 'right', noinsert = false})
        neoterm.run('dotnet run')
        running = true
    else
        vim.api.nvim_command("echo 'No specific command for this file type :"..extension.."'")
    end
end

vim.api.nvim_set_keymap('n', '<F5>', [[:lua execute_command_based_on_extension()<CR>]], { noremap = true, silent = true })

