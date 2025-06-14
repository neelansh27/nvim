local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      -- Ref: https://www.reddit.com/r/neovim/comments/wmkf9o/how_to_use_tab_and_shifttab_to_cycle_through/?rdt=59117
      -- Use tab key for completion
      -- ["<Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --               cmp.select_next_item()
      --       elseif luasnip.expand_or_jumpable() then
      --               luasnip.expand_or_jump()
      --       else
      --               fallback()
      --       end
      -- end, {"i", "s"}),

      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --               cmp.select_prev_item()
      --       elseif luasnip.jumpable(-1) then
      --               luasnip.jump(-1)
      --       else
      --               fallback()
      --       end
      -- end, {"i", "s"}),

    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', max_item_count = 200 },
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
        }, {
      { name = 'buffer' },
      { name = 'path' }
     })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
    })

    -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
    })

    -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline(':', {
    -- mapping = cmp.mapping.preset.cmdline(),
    -- sources = cmp.config.sources({
    --   { name = 'path' }
    -- }, {
    --   { name = 'cmdline' }
    -- })
-- })
