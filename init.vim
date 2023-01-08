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
Plug 'sainnhe/sonokai'
Plug 'ghifarit53/tokyonight-vim'
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'
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
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
call plug#end()
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
set completeopt=menu,menuone,noselect
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
lua require("user.bufferline")
lua require("user.lspconfig")
lua require('user.completion')
lua require("user.luasnips")
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<M-,>'

" inoremap <silent><expr>  pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call ShowDocumentation()<CR>
" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction

" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap ff  <Plug>(coc-format-selected)
" nmap ff  <Plug>(coc-format-selected)

" let g:airline_powerline_fonts = 0
" let g:airline_theme = 'gruvbox'
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#coc#enabled=1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:Hexokinase_highlighters =['backgroundfull']
let g:vcoolor_map = '<M-c>'
let g:vcool_ins_rgb_map = '<M-r>'
let g:vcool_ins_hsl_map = '<M-C>'
let g:vcool_ins_rgba_map = '<M-R>'
let b:ale_fixers = ['eslint']
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

let g:startify_lists = [{ 'type': 'sessions',  'header': ['   Sessions']},{ 'type': 'files',     'header': ['   Recent files']   },{ 'type': 'dir',       'header': ['   MRU '. getcwd()] },	  { 'type': 'bookmarks', 'header': ['   Bookmarks']},{ 'type': 'commands',  'header': ['   Commands']},]

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_transparent_background=1
let g:sonokai_disable_italic_comment = 0
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1

"make background transparent in any colorscheme 
" autocmd VimEnter * highlight Normal ctermbg=NONE guibg=NONE
" colorscheme tokyonight

colorscheme sonokai
