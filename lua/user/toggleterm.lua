require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  dir = "%:p:h",
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor=2,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, 
  
  direction ='float',

  close_on_exit = true, -- close the terminal window when the process exits
  
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
