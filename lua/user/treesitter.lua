require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go"},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
