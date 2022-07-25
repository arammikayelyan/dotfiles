require('lualine').setup({
  sections = {
    lualine_c = {
      {'filename', path = 1},
      'lsp_progress',
    },
  },
})
