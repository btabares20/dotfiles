-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
          'nvim-telescope/telescope.nvim', 
          -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
          'folke/tokyonight.nvim',
          as = 'tokyonight',
          config = function()
                  vim.cmd('colorscheme tokyonight-moon')
          end
  })

  use {
      'nvim-treesitter/nvim-treesitter',
      branch = 'main'
  }
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')

  use ('tpope/vim-fugitive')

  use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v3.x',
          requires = {
                  --- Uncomment the two plugins below if you want to manage the language servers from neovim
                  {'neovim/nvim-lspconfig'},
                  {'williamboman/mason.nvim'},
                  {'williamboman/mason-lspconfig.nvim'},

                  {'hrsh7th/nvim-cmp'},
                  {'hrsh7th/cmp-nvim-lsp'},
                  {'hrsh7th/cmp-buffer'},
                  {'hrsh7th/cmp-path'},
                  {'saadparwaiz1/cmp_luasnip'},
                  {'hrsh7th/cmp-nvim-lua'},
                  {'L3MON4D3/LuaSnip'},
                  {'rafamadriz/friendly-snippets'},
          }
  }

  use ('theprimeagen/vim-be-good')
  use ('nvim-treesitter/nvim-treesitter-context')
  use ({'stevearc/conform.nvim', config = function() require('conform').setup() end})
  use ('windwp/nvim-ts-autotag')
  use ('olrtg/nvim-emmet')
    -- Required plugins
  use 'stevearc/dressing.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'

  -- Optional dependencies
  use 'hrsh7th/nvim-cmp'
  use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  use 'HakonHarnes/img-clip.nvim'
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'leoluz/nvim-dap-go'
  use 'Weissle/persistent-breakpoints.nvim'

end)
