local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("n","<M-f>","<Cmd>NvimTreeToggle<CR>",opts)
keymap("n","<M-k>","<Cmd>bprevious<CR>",opts)
keymap("n","<M-j>",":bnext<CR>",opts)
keymap('n',"<C-s>","<Cmd>w<CR>",opts)
keymap('v',"<C-S-y>","\"+y",opts) --Copy to clipboardplus
-- keymap("v", "p", '"_dP', opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n","..",":noh<CR>",opts)
local wk = require('whichkey_setup')
wk.config{
    hide_statusline = false,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}
local mappings = {
     f = {
        name = '+find',
        s = {'<Cmd>w<CR>', 'Save File'},
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
        r = {'<Cmd>Telescope oldfiles<CR>', 'recent files'},
        f = {'<Cmd>Telescope find_files<CR>', 'Find Files'},
        F = {'<Cmd>NvimTreeToggle<CR>', 'Open File Tree'},
        p = {'<cmd>e ~/.config/nvim/init.vim<CR>', 'Edit Neovim Config'},
        c = {
            name = '+commands',
            c = {'<Cmd>Telescope commands<CR>', 'commands'},
            h = {'<Cmd>Telescope command_history<CR>', 'history'},
        },
        q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
    },
    g = {
            name = '+git',
            g = {'<Cmd>Git<CR>', 'commits'},
            c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
            b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
            s = {'<Cmd>Telescope git_status<CR>', 'status'},
            f = {'<Cmd>Telescope git_files<CR>', 'Find Files in Git repo'},
        },
        w = {
            name = '+window',
            w = {'<C-W>w', 'other window'},
            c = {'<C-W>c', 'close window'},
            h = {'<C-W>h', 'window-left'},
            j = {'<C-W>j', 'window-bottom'},
            k = {'<C-W>k', 'window-top'},
            l = {'<C-W>l', 'window-right'},
            e = {'<C-W>=', 'balance-window'},
            s = {'<C-W>s', 'split-window-below'},
            v = {'<C-W>v', 'split-window-vertically'},
            H = {'<C-W>H', 'window-left'},
            J = {'<C-W>J', 'window-bottom'},
            K = {'<C-W>K', 'window-top'},
            L = {'<C-W>L', 'window-right'},
},
        s={
            name = '+sessions',
            S = {'<cmd>Startify<CR>' , 'Open Dashboard'},
            s = {'<cmd>SSave<CR>' , 'Save Session'},
            d = {'<cmd>SDelete<CR>', 'Delete Session'},
            l = {'<cmd>SLoad<CR>' , 'Load Session'},
            c = {'<cmd>SClose<CR>' , 'Close Session'},
        },
        b= {
            name = '+buffer' ,
            k = {'<cmd>bd<CR>'        , 'delete-buffer'},
            f = {'<cmd>bfirst<CR>'    , 'first-buffer'},
            b = {'<cmd>Telescope buffers<cr>' , 'Show-buffers'},
            h = {'<cmd>Startify<CR>'  , 'home-buffer'},
            l = {'<cmd>blast<CR>'     , 'last-buffer'},
            n = {'<cmd>bnext<CR>'     , 'next-buffer'},
            N = {'<cmd>enew<CR>'     , 'new-buffer'},
            p = {'<cmd>bprevious<CR>' , 'previous-buffer'},
},
        n={
        name='+neovim',
        p={ name = "+plugins",
                i   = {'<cmd>PlugInstall<CR>', 'Install Plugins'},
                u   = {'<cmd>PlugUpdate<CR>', 'Update All Plugins'},
                v   = {'<cmd>PlugUpgrade<CR>', 'Update Vim Plug'},
                c   = {'<cmd>PlugClean<CR>', 'Remove Plugins'},
        },
    },
        q={
            name="+quit",
            q={'<cmd>q<CR>','quit from current window'},
            a={'<cmd>qa<CR>','quit from neovim'},
            w={'<cmd>wq<CR>','write and quit from current buffer'},
            Q={'<cmd>q!<CR>','force quit from buffer'},
            W={'<cmd>wq!<CR>','force write and quit from buffer'},
            A={'<cmd>qa!<CR>','force quit from neovim'},
        },
    o = {
    name='+open',
    t={'<cmd>!kitty \'%:p:h\' &<CR>','Open Terminal Here'},
    b={'<Cmd>!firefox \'%\'& <CR>','Open File in browser'},
    },
    l ={
        name='+lsp',
        r={"<cmd>lua vim.lsp.buf.rename()<CR>",'rename variable'},
        c={"<Cmd>lua vim.lsp.buf.code_action()<CR>", 'Code Actions'},
        h={"<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", 'toggle inlay hints'},
        i={"<Cmd>LspInfo<CR>","Lsp Info"},
        I={"<Cmd>LspInstallInfo<CR>",'Installed Servers'},
        R={"<Cmd>LspRestart<CR>",'Restart Servers'},
    }
}
wk.register_keymap('leader', mappings)
