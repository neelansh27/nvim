-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- apply border to every floating window
-- vim.o.winborder="single"

-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local lsp_flags = {
    debounce_text_changes = 150,
}

--Icons

-- This method is deprecated
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- local signs = { Error= " ", Warn=" ",Info = " ",Hint = "" }
-- for typeof, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. typeof
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- new way of defining signs
-- https://github.com/neovim/neovim/issues/33144
--

-- local _border = {
--     { '┌', 'FloatBorder' },
--     { '─', 'FloatBorder' },
--     { '┐', 'FloatBorder' },
--     { '│', 'FloatBorder' },
--     { '┘', 'FloatBorder' },
--     { '─', 'FloatBorder' },
--     { '└', 'FloatBorder' },
--     { '│', 'FloatBorder' },
-- }
local _border = "rounded";
-- require('lspconfig.ui.windows').default_options = {
--     border = 'single',
-- }
-- require('lspconfig.ui.windows').default_options.border = 'single'
vim.diagnostic.config({
    float = { border = _border },
    update_in_insert = true,
    -- virtual_text = true,
    virtual_text = {
        -- https://www.reddit.com/r/neovim/comments/12qs8bo/diagnostic_virtual_text_prefix_as_function/
        prefix = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return ""  -- Nerd font icon for error
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                return ""  -- Nerd font icon for warning
            elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                return ""  -- Nerd font icon for info
            else
                return ""  -- Nerd font icon for hint
            end
          end
    },
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})


--border customization
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border })
vim.lsp.handlers["textDocument/signatureHelp"] =vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border })

-- defining attach function
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    print("Lsp has begun...")
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- https://github.com/jdhao/nvim-config/blob/main/lua/config/lsp.lua#L177-L179
    -- https://www.reddit.com/r/neovim/comments/rjvrfp/how_to_use_border_with_vimlspbufhover/
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover { border = "rounded", max_height = 25, max_width = 120 }
    end, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = false,
--         underline = true,
--         signs = true,
--     }
-- )
-- Show diagnostics on hover
-- vim.o.updatetime = 1500
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--
--_

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local handlers = {
--     ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
--     ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
-- }
-- require('lspconfig.ui.windows').default_options = {
--     border = _border
-- }
--Underlining on Errors
-- vim.cmd[[
-- "autocmd CursorHold * lua vim.lsp.diagnostic.show_
-- ]]

--Server settings
-- require('lspconfig.ui.windows').default_options.background = "None"

require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
-- not conding in rust so commenting it out
-- require('lspconfig')['rust_analyzer'].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     flags = lsp_flags,
--     settings={
--         ["rust-analyzer"]={}
--     }
-- }
require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['cssls'].setup {
    cmd = { "css-languageserver", "--stdio" },
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
require 'lspconfig'.tailwindcss.setup {

    cmd = {
        "/home/ns/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server",
        "--stdio",
    },
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    root_dir = require('lspconfig').util.root_pattern("tailwind.config.js", "package.json"),
}
require('lspconfig')['html'].setup {
    cmd = { "/home/ns/.local/share/nvim/lsp_servers/html/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server", '--stdio' },
    on_attach = on_attach,
    filetypes = { "html", "htmldjango" },
    flags = lsp_flags,
    capabilities = capabilities,
}
require('lspconfig')['ts_ls'].setup {
    on_attach = on_attach,
    filetypes = { "typescriptreact", "typescript", "typescript-react", "javascript", "javascriptreact", "typescript.tsx", "javascript.jsx" },
    -- cmd = { "typescript-language-server", "--stdio" },
    flags = lsp_flags,
    capabilities = capabilities,
}
require 'lspconfig'.lua_ls.setup {
    cmd = { "/home/ns/Downloads/lua-language-server/bin/lua-language-server", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require 'lspconfig'.jdtls.setup {
    cmd = { 'jdtls' },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require 'lspconfig'.gopls.setup {
    cmd = { "/home/ns/.local/share/nvim/lsp_servers/go/gopls" },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require 'lspconfig'.prismals.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
