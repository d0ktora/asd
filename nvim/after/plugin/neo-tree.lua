vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>", {noremap=true,silent=true})
vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "󰌵", texthl = "DiagnosticSignHint"})
require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    window = {
        position = "left",
        width = 28,
        mapping_options = {
            noremap = true,
            nowait = false,
        },
    },
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function()
                vim.cmd("highlight! Cursor blend=100")
            end,
        },
        {
            event = "neo_tree_buffer_leave",
            handler = function()
                vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
            end,
        },
    },
    filesystem = {
        filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    }
})
