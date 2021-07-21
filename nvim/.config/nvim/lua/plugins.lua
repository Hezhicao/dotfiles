vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- ===
  -- === LSP
  -- ===
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- ===
  -- === Debugger
  -- ===
  use 'puremourning/vimspector'

  -- ===
  -- === Test
  -- ===
  use 'janko/vim-test'

  -- ===
  -- === Git
  -- ===
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'

  -- ===
  -- === Filesystem
  -- ===
  use 'kevinhwang91/rnvimr'

  -- ===
  -- === Colorscheme & Icons
  -- ===
  use 'againxx/ayu-vim'
  use 'kyazdani42/nvim-web-devicons'

  -- ===
  -- === Statusline
  -- ===
  use 'hoob3rt/lualine.nvim'
  use 'romgrk/barbar.nvim'

  -- ===
  -- === Window & Buffer & Keybindings
  -- ===
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- ===
  -- === Fuzzy Finder
  -- ===
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'GustavoKatel/telescope-asynctasks.nvim'
  use 'fhill2/telescope-ultisnips.nvim'
  use 'bi0ha2ard/telescope-ros.nvim'

  -- ===
  -- === Highlighting
  -- ===
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use 'pboettch/vim-cmake-syntax'
  use 'vim-scripts/SyntaxAttr.vim'
  use 'againxx/python-syntax'
  use 'againxx/vim-valgrind'
  use 'aklt/plantuml-syntax'
  use 'PeterRincker/vim-searchlight' -- highlight current search match
  use 'norcalli/nvim-terminal.lua' -- highlight terminal escape sequences
  use 'kevinoid/vim-jsonc'

  -- ===
  -- === Search & Move
  -- ===
  use 'haya14busa/incsearch.vim'
  use 'haya14busa/incsearch-fuzzy.vim'
  use 'justinmk/vim-sneak'
  use 'unblevable/quick-scope' -- highlight for f & t
  use 'yuttie/comfortable-motion.vim' -- physically plausible motion

  -- ===
  -- === Comment & Surround & Parenthsis
  -- ===
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat' -- repeat plugin map with '.', work with vim-surround
  use 'tpope/vim-commentary'
  use 'luochen1990/rainbow'
  use 'andymass/vim-matchup'

  -- ===
  -- === Snippets
  -- ===
  use 'SirVer/ultisnips'
  use 'againxx/vim-snippets'

  -- ===
  -- === Python
  -- ===
  use 'michaeljsmith/vim-indent-object'
  use 'Vimjas/vim-python-pep8-indent'
  use 'goerz/jupytext.vim'

  -- ===
  -- === Cpp
  -- ===
  use 'skywind3000/vim-cppman'

  -- ===
  -- === Assembly
  -- ===
  use 'Shirk/vim-gas'

  -- ===
  -- === Markdown
  -- ===
  -- this plugin is needed by vim-markdown and can be used to align text
  use { 'godlygeek/tabular', ft = 'markdown' }
  use 'plasticboy/vim-markdown'
  use {
    'iamcco/markdown-preview.nvim', ft = 'markdown',
    run = function() vim.fn['mkdp#util#install']() end
  } -- use pre build
  use {
    'dhruvasagar/vim-table-mode', cmd = {'TableModeToggle', 'TableModeEnable'}
  }

  -- ===
  -- === Wiki
  -- ===
  use { 'vimwiki/vimwiki', branch = 'dev' }
  use 'tools-life/taskwiki'
  use {
    'michal-h21/vim-zettel',
    ft = 'vimwiki',
    requires = {
      { 'junegunn/fzf', ft = 'vimwiki' },
      { 'junegunn/fzf.vim', ft = 'vimwiki' },
    },
    config = function() require'fzf' end
  }

  -- ===
  -- === Task system
  -- ===
  use 'skywind3000/asynctasks.vim'
  use 'skywind3000/asyncrun.vim'

  -- ===
  -- === Tmux Integration
  -- ===
  use {
    'edkolev/tmuxline.vim', cmd = {'Tmuxline', 'TmuxlineSnapshot'}
  }
  use 'christoomey/vim-tmux-navigator'
  use 'jpalardy/vim-slime'
  use 'wellle/tmux-complete.vim'

  -- ===
  -- === Curosr & Alignment
  -- ===
  use 'mg979/vim-visual-multi'
  use 'junegunn/vim-easy-align'

  -- ===
  -- === Documentation
  -- ===
  -- Read Unix man pages in vim
  use 'jez/vim-superman'
  use 'HiPhish/info.vim'

  -- ===
  -- === Custom Text Objects
  -- ===
  use 'kana/vim-textobj-user'
  -- use 'againxx/vim-textobj-underscore'
  use 'Julian/vim-textobj-variable-segment'

  -- ===
  -- === Utility
  -- ===
  use 'tpope/vim-capslock'
  use 'AndrewRadev/switch.vim'
  use { 'Konfekt/FastFold', ft = 'python' }
  use {
    'mbbill/undotree', cmd = 'UndotreeToggle',
    config = function() require'undotree' end
  }
  use 'lambdalisue/suda.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'rlue/vim-barbaric', ft = {'markdown', 'vimwiki'} }
  use { 'szw/vim-maximizer', cmd = 'MaximizerToggle' }
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'tpope/vim-abolish'
  use 'danro/rename.vim'
  -- embed neovim in browser input box
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- ===
  -- === Training Vim
  -- ===
  use { 'ThePrimeagen/vim-be-good', cmd = 'VimBeGood' }

end,
config = {
  profile = {
    enable = false,
  }
}})
