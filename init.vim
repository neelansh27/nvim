set autochdir
set ttimeoutlen=0
set timeoutlen=1000
set clipboard="unnamed"
set fileencoding="utf-8"
set hlsearch
set ignorecase
set mouse=a
set pumheight=10
set smartcase
set smartindent
set splitbelow
set undofile
set splitright
set termguicolors
set updatetime=300
set expandtab
set showtabline=4
set shiftwidth=4
set softtabstop=4
set number
set relativenumber
set numberwidth=1
set wrap
" Glyph symbols were not visible when font was fixed
set guifont="Caskaydia Cove Nerd Font:h15"    
set autoindent
set foldmethod=indent
set foldlevel=99
set whichwrap+=<,>,[,],h,l
set iskeyword+=#
set completeopt=menu,menuone,noselect


"Read files when modified on disk
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


"Set tabwidth to 8 for golang
autocmd FileType go setlocal shiftwidth=8 tabstop=8

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

"Handling Comments
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring',

Plug 'kyazdani42/nvim-tree.lua'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'KabbAmine/vCoolor.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'liuchengxu/vim-which-key'
Plug 'AckslD/nvim-whichkey-setup.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'akinsho/bufferline.nvim'
Plug 'neovim/nvim-lspconfig'
" The author has archived this nvim-lsp-installer, will switch to mason in future
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'mfussenegger/nvim-dap'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-path'
Plug 'rafamadriz/friendly-snippets'
" npm -i -g prettier
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

vmap <C-space> <cmd>lua cmp.complete()<CR>
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
" let g:vcool_ins_rgba_map = '<M-R>'
let b:ale_fixers = ['eslint']
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<M-,>'
let g:user_emmet_install_global = 1
let g:startify_custom_header =
          \ 'startify#center(startify#fortune#cowsay())'

let g:startify_fortune_use_unicode = 1
let g:startify_files_number=8
let g:startify_enable_special = 0
let g:startify_bookmarks = ['~/Code']
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
colorscheme tokyonight
