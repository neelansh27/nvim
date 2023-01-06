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
Plug 'ghifarit53/tokyonight-vim'
" Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
" let g:polyglot_disabled = ['scss']
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-commentary'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mattn/emmet-vim'
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'KabbAmine/vCoolor.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'liuchengxu/vim-which-key'
Plug 'AckslD/nvim-whichkey-setup.lua'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mlaursen/vim-react-snippets'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A
inoremap <M-f> <Esc><Space>wi
inoremap <M-b> <Esc>bi
inoremap <M-d> <Esc>cw
let g:multi_cursor_select_all_word_key = '<M-n>'
" lua require("neelansh.plugins")
" lua require("neelansh.treesitter")
let g:lsp_settings_servers_dir='/home/ns/.config/nvim/vim-lsp-settings/servers'

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

call which_key#register('<space>', "g:which_key_map")
call which_key#register('<space>', "g:which_key_map", 'n')
call which_key#register('<space>', "g:which_key_map_visual", 'v')

lua require("user.toggleterm")
lua require("user.nvim-tree")
lua require("user.keybindings")
lua require("user.lualine_conf")
lua require("user.treesitter")
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{', '}']]
let g:rainbow#max_level = 20


function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-snippets' ]
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap ff  <Plug>(coc-format-selected)
nmap ff  <Plug>(coc-format-selected)

let g:airline_powerline_fonts = 0
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#coc#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:Hexokinase_highlighters =['backgroundfull']
let g:vcoolor_map = '<M-c>'
let g:vcool_ins_rgb_map = '<M-r>'
let g:vcool_ins_hsl_map = '<M-C>'
let g:vcool_ins_rgba_map = '<M-R>'

let b:ale_fixers = ['eslint']
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

let g:startify_lists = [{ 'type': 'sessions',  'header': ['   Sessions']},{ 'type': 'files',     'header': ['   Recent files']   },{ 'type': 'dir',       'header': ['   MRU '. getcwd()] },	  { 'type': 'bookmarks', 'header': ['   Bookmarks']},{ 'type': 'commands',  'header': ['   Commands']},]

" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 0
" let g:sonokai_transparent_background=1
" let g:sonokai_disable_italic_comment = 0
let g:tokyonight_transparent_background = 1
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
"make background transparent in any colorscheme 
" autocmd VimEnter * highlight Normal ctermbg=NONE guibg=NONE
" colorscheme sonokai


