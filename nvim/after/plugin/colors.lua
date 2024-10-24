--vim.cmd.colorscheme("absent-contrast")
vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("vscode")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.diagnostic.config{float={border='rounded'}}

-- vim.cmd([[ hi FloatBorder guibg=NONE ctermbg=NONE guifg=#217013]])
vim.cmd([[
  hi TelescopeNormal guibg=NONE ctermbg=NONE
  hi TelescopeResults guibg=NONE ctermbg=NONE
  hi TelescopePromptBorder guibg=NONE ctermbg=NONE
  hi TelescopeBorder guibg=NONE ctermbg=NONE
  hi TelescopePromptPrefix guibg=NONE ctermbg=NONE
  hi TelescopeMatching guibg=NONE ctermbg=NONE
]])

-- Enable true color support
vim.opt.termguicolors = true

-- Set the cursor to white in normal mode
vim.api.nvim_set_hl(0, 'Cursor', { fg = 'black', bg = 'white' })

-- Set the cursor to white in insert mode
vim.api.nvim_set_hl(0, 'iCursor', { fg = 'black', bg = 'white' })

-- Configure the cursor shape and colors
vim.opt.guicursor = {
    'n-v-c:block-Cursor',
    'i-ci-ve:ver25-iCursor',
    'r-cr-o:hor20'
}
vim.api.nvim_set_hl(0, 'Visual', { bg="#aaaaaa", })
vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NonText guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi StatusLineNC guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi StatusLine guibg=NONE ctermbg=NONE ]])
vim.cmd('highlight VertSplit guifg=#ca3265 ctermbg=none')
vim.cmd([[ hi VertSplitNC guibg=none ctermbg=NONE ]])
-- vim.cmd([[ hi Directory guibg=NONE guifg=#ca3265 gui=bold cterm=bold]])
vim.cmd([[ hi! LineNr guibg=NONE ctermbg=NONE guifg=#9ccfd8 ctermfg=blue]])
vim.cmd([[ hi! SignColumn guibg=NONE ctermbg=NONE ]])

vim.cmd([[highlight Cursor guifg=white guibg=NONE]])
vim.cmd('set guifont=HackNerdFontMono-Regular:h12')

local function col(x, y)
    vim.cmd('hi '..x..' guifg='..y)
end

local col1 = '#f0f0f0' --white
local col2 = '#f5d253' --yellow
local col3 = '#5de4c7' --cyan
local col4 = '#8ad55e' --blue
local col5 = '#91b4d5' --grayblue
local col6 = '#d0679d' --red
local col7 = '#'
local col8 = '#'

--col('Identifier', col1)
--
--col('Operator', col1)
--col('String', col2)
--col('Character', col2)
--
--col('Constant', col3)
--col('Number', col3)
--col('Float',col3)
--
--col('Conditional', col4)
--col('Statement', col4)
--
--col('Type', col4)
--col('Structure', col4)
--col('Typedef', col4)
--col('Repeat', col4)
--col('Label', col4)
--col('Keyword', col4)
--
--col('PreProc', col4)
--
col('@property', col1)
--col('@keyword.define', col5)

