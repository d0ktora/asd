vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'nvim-treesitter/nvim-treesitter-context'
	use 'wbthomason/packer.nvim'
    use 'phpactor/phpactor'
    use {'rose-pine/neovim'}
    use {'nyoom-engineering/oxocarbon.nvim'}
    use {'Mofiqul/vscode.nvim'}
    use {'rainglow/vim'}
    use {'keiyakeiya/PapilioDehaanii.vim'}
	use {'nvim-neo-tree/neo-tree.nvim',
        requires = {
            {'nvim-tree/nvim-web-devicons'},
            {'MunifTanjim/nui.nvim'},
            {'nvim-lua/plenary.nvim'},
    }}
    use {'mhartington/formatter.nvim'}
    use {"lukas-reineke/indent-blankline.nvim"}
    use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'},
                   {'nvim-telescope/telescope-ui-select.nvim'},
                   {'BurntSushi/ripgrep'}}
	}
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
	use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        "kylechui/nvim-surround",
        tag = "*" -- Use for stability; omit to use `main` branch for the latest features
    })

    --use {
    --   'VonHeikemen/lsp-zero.nvim',
    --    branch = 'v3.x',
    --    requires = {

    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'L3MON4D3/LuaSnip'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'rafamadriz/friendly-snippets'}
    use {"saadparwaiz1/cmp_luasnip"}
    use {"p00f/clangd_extensions.nvim"}

    use{ 'itmecho/neoterm.nvim' }
end)

