local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[ augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim' -- Have packer manage itself

  -- LSP
  use 'neovim/nvim-lspconfig' -- Enable LSP
  use 'williamboman/nvim-lsp-installer' -- Simple to use language server installer

  -- CMP
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- Neovim LSP completions
  use 'hrsh7th/cmp-buffer' -- Buffer completions
  use 'hrsh7th/cmp-path' -- Path completions
  use 'hrsh7th/cmp-cmdline' -- Cmdline completions
  --use 'hrsh7th/cmp-nvim-lua'

  -- Snippets
  use 'L3MON4D3/LuaSnip' -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
  use 'rafamadriz/friendly-snippets' -- A bunch of snippets to use

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Go support
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

  -- Color scheme
  use 'sainnhe/sonokai'
  use 'arcticicestudio/nord-vim'
  use 'sainnhe/everforest'
  use 'rebelot/kanagawa.nvim'
  use 'sainnhe/gruvbox-material'

  -- Others
  use 'majutsushi/tagbar'
  use 'folke/trouble.nvim'
  use 'windwp/nvim-autopairs'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-telescope/telescope.nvim' -- Lazy find
  --use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  --use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
  use 'kyazdani42/nvim-web-devicons'

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- File Tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Test unit
  use {
    'nvim-neotest/neotest',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'nvim-neotest/neotest-go',
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message
                :gsub("\n", " ")
                :gsub("\t", " ")
                :gsub("%s+", " ")
                :gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
    end
  }

  -- Markdown preview
  use {
    'iamcco/markdown-preview.nvim',
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
