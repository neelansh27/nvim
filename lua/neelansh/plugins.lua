vim.cmd([[packadd packer.nvim]])
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
return require('packer').startup(function(use)
      use {'neoclide/coc.nvim',branch = 'master'}
      use 'wbthomason/packer.nvim'
      use 'sainnhe/sonokai'
      use 'kyazdani42/nvim-web-devicons'
      use 'sheerun/vim-polyglot'
      use 'mhinz/vim-startify'
      use 'akinsho/toggleterm.nvim'
      use 'tpope/vim-commentary'
      use 'kyazdani42/nvim-tree.lua'
      use 'mattn/emmet-vim'
      use 'junegunn/rainbow_parentheses.vim'
      use 'vim-airline/vim-airline-themes'
      use 'vim-airline/vim-airline'
      use 'jiangmiao/auto-pairs'
      use 'KabbAmine/vCoolor.vim'
      use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
      }
      use {'rrethy/vim-hexokinase', run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'}
      vim.cmd('au BufEnter * HexokinaseTurnOn')
end)

