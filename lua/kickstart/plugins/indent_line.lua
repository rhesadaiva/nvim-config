local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

return {
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {
    scope = {
      enabled = false,
    },
    indent = {
      highlight = highlight,
      repeat_linebreak = false,
      priority = 2,
      tab_char = { '|' },
    },
  },
}
