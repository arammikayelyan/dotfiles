vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("aram.mappings")
require("aram.options")
require("aram.plugins")

-- Enable Comment.nvim
require('Comment').setup()

-- -- Enable `lukas-reineke/indent-blankline.nvim`
-- -- See `:help indent_blankline.txt`
-- require('indent_blankline').setup {
--   char = '┊',
--   show_trailing_blankline_indent = false,
-- }


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

