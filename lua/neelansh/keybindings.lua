local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("n","<M-.>",":NvimTreeToggle<CR>",opts)
keymap("n","<M-h>",":bprevious<CR>",opts)
keymap("n","<M-l>",":bnext<CR>",opts)
keymap("v", "p", '"_dP', opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n","..",":noh<CR>",opts)
local wk = require('whichkey_setup')
wk.config{
    hide_statusline = true,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}
local mappings = {
     f = {
        name = '+find',
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
        f = {'<Cmd>NvimTreeToggle<CR>', 'Open File Tree'},
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
    o = {
    name='+open',
    t={'<cmd>!kitty \'%:p:h\' &<CR>','Open Terminal Here'},
    b={'<Cmd>!firefox \'%\'& <CR>','Open File in browser'}
    }
}
wk.register_keymap('leader', mappings)
