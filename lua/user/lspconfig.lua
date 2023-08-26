-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    print("Lsp has begun...")
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
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

local lsp_flags = {
    debounce_text_changes = 150,
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
    virtual_text = false,
    underline = true,
    signs = true,
}
)
-- Show diagnostics on hover
-- vim.o.updatetime = 1500
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local capabilities = require('cmp_nvim_lsp').default_capabilities()

--border customization
local _border = "single"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
    border = _border,
}
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
    border = _border,
}
)
vim.diagnostic.config {
    float = { border = _border }
}
require('lspconfig.ui.windows').default_options = {
    border = _border
}
--Underlining on Errors
-- vim.cmd[[ 
-- "autocmd CursorHold * lua vim.lsp.diagnostic.show_
-- ]]
--Icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- local signs = { Error= " ", Warn=" ",Info = " ",Hint = "" }
for typeof, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. typeof
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
--Server settings
-- require('lspconfig.ui.windows').default_options.background = "None"

require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings={
        ["rust-analyzer"]={}
    }
}
require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['cssls'].setup {
    cmd = {"css-languageserver", "--stdio"},
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
require('lspconfig')['html'].setup {
    on_attach = on_attach,
    filetypes = {"html", "htmldjango"},
    flags = lsp_flags,
    capabilities = capabilities,
}
require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescript-react", "javascript", "typescript.tsx", "javascript.jsx" },
    cmd = { "typescript-language-server", "--stdio" },
    flags = lsp_flags,
    capabilities = capabilities,
}
require 'lspconfig'.lua_ls.setup {
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
