set autochdir
set ttimeoutlen=0
set timeoutlen=1000
set clipboard="unnamed"
set fileencoding="utf-8"
set hlsearch
set ignorecase
set mouse=a
set pumheight=10
set showtabline=2
set smartcase
set smartindent
set splitbelow
set undofile
set splitright
set termguicolors
set updatetime=300
set expandtab
set shiftwidth=4
set softtabstop=4
set number
"set relativenumber = false
set numberwidth=1
set wrap
set guifont="JetBrains Mono:h15"
set autoindent
set foldmethod=indent
set foldlevel=99
set whichwrap+=<,>,[,],h,l
set iskeyword+=#
set completeopt=menu,menuone,noselect
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
call plug#begin()
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify', {'branch': 'center'}
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-commentary'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'KabbAmine/vCoolor.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'liuchengxu/vim-which-key'
Plug 'AckslD/nvim-whichkey-setup.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-path'
Plug 'rafamadriz/friendly-snippets'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'sbdchd/neoformat'
" Plug 'jmcomets/vim-pony'
call plug#end()

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
lua require("user.keybindings")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
call which_key#register('<space>', "g:which_key_map")
call which_key#register('<space>', "g:which_key_map", 'n')
call which_key#register('<space>', "g:which_key_map_visual", 'v')
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_locally_jumpable()? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
imap <C-s> <ESC>:w<CR>i
" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

lua require("user.toggleterm")
lua require("user.nvim-tree")
lua require("user.lualine_conf")
lua require("user.treesitter")
lua require("user.bufferline")
lua require("user.lspconfig")
lua require("user.luasnips")
lua require('user.completion')
lua require("user.telescope")

let g:multi_cursor_select_all_word_key = '<A-n>'

let g:Hexokinase_highlighters =['backgroundfull']
let g:vcoolor_map = '<M-c>'
let g:vcool_ins_rgb_map = '<M-r>'
let g:vcool_ins_hsl_map = '<M-C>'
let g:vcool_ins_rgba_map = '<M-R>'
let b:ale_fixers = ['eslint']
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<M-,>'
let g:startify_custom_header =
          \ 'startify#center(startify#fortune#cowsay())'

let g:startify_fortune_use_unicode = 1
let g:startify_files_number=8
let g:startify_enable_special = 0
let g:startify_bookmarks = ['~/Programs']
" \ { 'type': 'dir',       'header': startify#center(['MRU '.getcwd()]) },
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['Bookmarks'], 'indices':['p']},
    \ { 'type': 'sessions',  'header': ['Sessions'] , 'indices': ['a','b','c','d','e','f','g','h','i','j','k']},
    \ { 'type': 'files',     'header': ['Recent Files'], 'indices': range(1,10) },
    \ { 'type': 'commands',  'header': ['Commands'], 'indices': range(1,10)},
    \ ]
let g:startify_padding_left = 03 " Hard coded padding for lists
" let g:startify_lists = [
"     \ { 'type': 'bookmarks', 'header': startify#center(['Bookmarks']), 'indices': range(1,10)},
"     \ { 'type': 'sessions',  'header': startify#center(['Sessions']) , 'indices': range(1,10)},
"     \ { 'type': 'files',     'header': startify#center(['Recent Files']), 'indices': range(1,10) },
"     \ { 'type': 'commands',  'header': startify#center(['Commands']), 'indices': range(1,10)},
"     \ ]


" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 1
" let g:sonokai_transparent_background=1
" let g:sonokai_disable_italic_comment = 0

" make background transparent in any colorscheme 
" autocmd VimEnter * highlight Normal ctermbg=NONE guibg=NONE
lua require("user.tokyonight")
" lua require("user.gruvbox")

