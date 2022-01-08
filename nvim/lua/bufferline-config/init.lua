offsets1 = {{
    filetype = "nerdtree",
    highlight = "Directory",
    text_align = "right"
  }
}
require('bufferline').setup{
  options = {
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    offsets = offsets1, 
    show_close_icon = false,
    separator_style = "thick"
  }
}
