-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local opts = { noremap = true }

keymap("n", "<leader>w", ":up<cr>", {})
keymap("n", "<F1>", "<cmd>so %<cr>", {})
keymap("i", "jj", "<esc>", {})

keymap("n", "#", "#zzzv", { desc = "Search and center screen" })
keymap("n", "*", "*zzzv", { desc = "Search and center screen" })
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
-- keymap("n", "{", "{zzzv", opts)
-- keymap("n", "}", "}zzzv", opts)
keymap("n", "J", "mzJ`z", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "<space>a", "ggVG<c-$>", opts) -- Select all
keymap("n", "cn", "*``cgn", opts)

keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+y', opts)

keymap("n", "gl", "$", opts) -- go to the end of the line
keymap("n", "gh", "^", opts) -- go to the start of the line

keymap("t", "<space>q", "exit<CR>", opts) -- exit the terminal

-- Select (charwise) the contents of the current line, excluding indentation.
keymap("n", "vv", "^vg_")

-- Save all files.
keymap("n", "<F2>", "<cmd>wall<cr>")

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap("n", "zv", "zMzvzz")

-- Close current fold when open. Always open next fold.
keymap("n", "zj", "zcjzOzz")

-- Close current fold when open. Always open previous fold.
keymap("n", "zk", "zckzOzz")

-- {{{ d - Debug Adapter Protocol (DAP).

keymap("n", "<leader>dC", [[<cmd>lua require'dap'.run_to_cursor()<cr>]])
keymap("n", "<leader>db", [[<cmd>lua require'dap'.step_back()<cr>]])
keymap("n", "<leader>dc", [[<cmd>lua require'dap'.continue()<cr>]])
keymap("n", "<leader>dd", [[<cmd>lua require'dap'.disconnect()<cr>]])
keymap("n", "<leader>dg", [[<cmd>lua require'dap'.session()<cr>]])
keymap("n", "<leader>di", [[<cmd>lua require'dap'.step_into()<cr>]])
keymap("n", "<leader>dl", [[<cmd>lua require'dap'.open_logfile()<cr>]])
keymap("n", "<leader>do", [[<cmd>lua require'dap'.step_over()<cr>]])
keymap("n", "<leader>dp", [[<cmd>lua require'dap'.pause()<cr>]])
keymap("n", "<leader>dq", [[<cmd>lua require'dap'.close()<cr>]])
keymap("n", "<leader>dr", [[<cmd>lua require'dap'.repl.toggle()<cr>]])
keymap("n", "<leader>ds", [[<cmd>lua require'dap'.continue()<cr>]])
keymap("n", "<leader>dt", [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]])
keymap("n", "<leader>du", [[<cmd>lua require'dap'.step_out()<cr>]])

-- Mimic Microsoft Visual Code / Studio products.
keymap("n", "<F5>", [[<cmd>lua require'dap'.continue()<cr>]])
keymap("n", "<F10>", [[<cmd>lua require'dap'.step_over()<cr>]])
keymap("n", "<F11>", [[<cmd>lua require'dap'.step_into()<cr>]])
keymap("n", "<F12>", [[<cmd>lua require'dap'.step_out()<cr>]])

-- DAPUI
keymap("n", "<leader>dU", [[<cmd>lua require'dapui'.toggle()<cr>]])

-- ------------------------------------------------------------------------- }}}

-- keymap("n", "<leader>sl", vim.cmd.SidewaysLeft)
-- keymap("n", "<leader>sr", vim.cmd.SidewaysRight)

-- keymap("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
