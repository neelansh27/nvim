require('telescope').setup({
  defaults = {
    layout_config = {
      width = 0.95,
      height = 0.95,
  },

    },
    pickers={
        find_files={
            theme="dropdown",
        },
        oldfiles={
            theme="dropdown"
        },
    -- other defaults configuration here
    },
  -- other configuration values here
})
