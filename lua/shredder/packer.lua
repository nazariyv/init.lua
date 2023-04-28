-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder (files, lsp, etc)
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Fuzzy Finder Algorith which requires local dependencies to be built. Only load if `make` is available
  use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
      cond = vim.fn.executable 'make' == 1
  }

  use { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("lewis6991/gitsigns.nvim")
  use("nvim-treesitter/nvim-treesitter-context")
  use("nvim-lualine/lualine.nvim") -- Fancier statusline
  use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

end)

