-- Gitsigns
-- See `:help gitsigns.txt`
-- require('gitsigns').setup {
--   signs = {
--     add = { text = '+' },
--     change = { text = '~' },
--     delete = { text = '_' },
--     topdelete = { text = '‾' },
--     changedelete = { text = '~' },
--   },
-- }

-- GitSigns
require("gitsigns").setup {
  signs = {
    add = {
      hl = "DiffAdd",
      text = "│",
      numhl = "GitSignsAddNr",
    },
    change = {
      hl = "DiffChange",
      text = "",
      numhl = "GitSignsChangeNr",
    },
    delete = {
      hl = "DiffDelete",
      text = "_",
      show_count = true,
      numhl = "GitSignsDeleteNr",
    },
    topdelete = {
      hl = "DiffDelete",
      text = "‾",
      show_count = true,
      numhl = "GitSignsDeleteNr",
    },
    changedelete = {
      hl = "DiffChange",
      text = "~",
      show_count = true,
      numhl = "GitSignsChangeNr",
    },
  },
  count_chars = {
    [1] = "",
    [2] = "₂",
    [3] = "₃",
    [4] = "₄",
    [5] = "₅",
    [6] = "₆",
    [7] = "₇",
    [8] = "₈",
    [9] = "₉",
    ["+"] = "",
  },
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  numhl = true,
  -- word_diff = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

    -- Actions
    map({ "n", "v" }, "<leader>hs", gs.stage_hunk)
    map({ "n", "v" }, "<leader>hr", gs.reset_hunk)
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hu", gs.undo_stage_hunk)
    map("n", "<leader>hR", gs.reset_buffer)
    map("n", "<leader>hp", gs.preview_hunk)
    map("n", "<leader>hb", function()
      gs.blame_line { full = true }
    end)
    map("n", "<leader>tb", gs.toggle_current_line_blame)
    map("n", "<leader>hd", gs.diffthis)
    map("n", "<leader>hD", function()
      gs.diffthis "~"
    end)
    map("n", ",td", function()
      gs.toggle_deleted()
      gs.toggle_word_diff()
    end)
    map("n", "<leader>hn", gs.toggle_numhl)
    map("n", "<leader>hh", gs.toggle_linehl)

    -- Hunk Text Object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}

