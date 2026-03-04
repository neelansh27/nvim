require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go", "python"},
  sync_install = false,
  auto_install = false,
  -- indent = {
  --   enabled = true,
  -- },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
