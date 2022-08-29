vim.cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]]

use = require("packer").use
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'Rigellute/rigel'

  -- LSP Client
  use 'neovim/nvim-lspconfig'

  -- Language Server installer
  use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
  }

  use 'kdheepak/lazygit.nvim'

  -- BONUS: Customizations over LSP
  -- Show VSCode-esque pictograms
  use 'onsails/lspkind-nvim'
  -- show various elements of LSP as UI
  use {'tami5/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}

  -- Autocompletion plugin
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip'
    }
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- snippets
  use {
    'hrsh7th/cmp-vsnip', requires = {
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
    }
  }

  use 'L3MON4D3/LuaSnip'
  use "rafamadriz/friendly-snippets"

  -- bracket autocompletion
  use 'vim-scripts/auto-pairs-gentle'

  -- Fancier statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
    },
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'

  require'nvim-web-devicons'.setup {
    override = {
     zsh = {
       icon = "",
       color = "#428850",
       cterm_color = "65",
       name = "Zsh"
     }
    };
    default = true;
    get_icons = true;
   }
  require'nvim-web-devicons'.get_icons()

  -- debugging
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

end)
