require("doktora.remap")
require("doktora.set")

if vim.fn.has("nvim") then

  vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
end

if vim.fn.has("termguicolors") then
  vim.o.termguicolors = true
end

require('lualine').setup {
    options={
        theme = 'codedark'
    }
}
vim.o.showmode = false
