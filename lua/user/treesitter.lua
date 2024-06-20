require'nvim-treesitter.configs'.setup {
  ensure_installed = {},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true,
  },
}
