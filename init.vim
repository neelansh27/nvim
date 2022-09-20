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

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

call plug#begin()
Plug 'neoclide/coc.nvim',{'branch':'master'}
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
let g:polyglot_disabled = ['scss']
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-commentary'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mattn/emmet-vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'KabbAmine/vCoolor.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'liuchengxu/vim-which-key'
Plug 'AckslD/nvim-whichkey-setup.lua'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'tpope/vim-fugitive'
call plug#end()

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

call which_key#register('<space>', "g:which_key_map")
call which_key#register('<space>', "g:which_key_map", 'n')
call which_key#register('<space>', "g:which_key_map_visual", 'v')

lua require("neelansh.toggleterm")
lua require("neelansh.nvim-tree")
lua require("neelansh.keybindings")

let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{', '}']]
let g:rainbow#max_level = 20


function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<M-,>'

augroup rainbow_lisp
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END
" inoremap <silent><expr>  pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#coc#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:Hexokinase_highlighters =['backgroundfull']
let g:vcoolor_map = '<M-d>'
let g:vcool_ins_rgb_map = '<M-r>'
let g:vcool_ins_hsl_map = '<M-f>'
let g:vcool_ins_rgba_map = '<M-R>'

let b:ale_fixers = ['eslint']
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

let g:startify_lists = [{ 'type': 'sessions',  'header': ['   Sessions']},{ 'type': 'files',     'header': ['   Recent files']   },{ 'type': 'dir',       'header': ['   MRU '. getcwd()] },	  { 'type': 'bookmarks', 'header': ['   Bookmarks']},{ 'type': 'commands',  'header': ['   Commands']},]

" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 0
" let g:sonokai_transparent_background=1
" let g:sonokai_disable_italic_comment = 0

"make background transparent in any colorscheme 
autocmd VimEnter * highlight Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox


