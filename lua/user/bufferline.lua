local bufferline=require("bufferline")
bufferline.setup{
  options = {
  style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
  show_tab_indicators = true,
  indicator = {
    icon = '▎', -- this should be omitted if indicator style is not 'icon'
    style = 'icon',
  },
  diagnostics = "nvim_lsp",
  diagnostics_indicator = function(count, level, diagnostics_dict, context)
    local icon = (level:match("error") and "") or (level:match("warning") and "") or ""
    return icon
  end,
  },
}
