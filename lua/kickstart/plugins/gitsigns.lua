-- return {
--   {
--     'lewis6991/gitsigns.nvim',
--     opts = {
--       signs = {
--         add = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
--         change = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
--         delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
--         topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
--         changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
--       },
--       signcolumn = true,
--       numhl = false,
--       linehl = false,
--       word_diff = true,
--       watch_gitdir = {
--         follow_files = true,
--       },
--       auto_attach = true,
--       attach_to_untracked = false,
--       current_line_blame = true,
--       current_line_blame_opts = {
--         virt_text = true,
--         virt_text_pos = 'eol',
--         delay = 1000,
--         ignore_whitespace = false,
--         virt_text_priority = 100,
--       },
--       current_line_blame_formatter = '<author>, <author_time:%d-%m-%Y> - <summary>',
--       sign_priority = 6,
--       update_debounce = 100,
--       status_formatter = nil,
--       max_file_length = 40000,
--       preview_config = {
--         border = 'single',
--         style = 'minimal',
--         relative = 'cursor',
--         row = 0,
--         col = 1,
--       },
--       yadm = {
--         enable = false,
--       },
--     },
--     config = function(_, opts)
--       require('gitsigns').setup(opts)
--     end,
--   },
-- }
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    current_line_blame_formatter = '<author>, <author_time:%d-%m-%Y> - <summary>',
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      --Navigation
      map('n', ']h', gs.next_hunk, 'Next Hunk')
      map('n', '[h', gs.prev_hunk, 'Prev Hunk')

      -- Actions:w
      --
      map('n', '<leader>hs', gs.stage_hunk, 'Stage Hunk')
      map('n', '<leader>hr', gs.reset_hunk, 'Reset Hunk')
      map('v', '<leader>hs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Stage Hunk')
      map('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Reset Hunk')

      map('n', '<leader>hS', gs.stage_buffer, 'Stage Buffer')
      map('n', '<leader>hR', gs.reset_buffer, 'Reset Buffer')
      map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
      map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')

      map('n', '<leader>hb', function()
        gs.blame_line { full = true }
      end, 'Blame Line')

      map('n', '<leader>hB', gs.toggle_current_line_blame, 'Toggle Line Blame')

      map('n', '<leader>hd', gs.diffthis, 'Diff This')
      map('n', '<leader>hD', function()
        gs.diffthis '~'
      end, 'Diff this ~')

      -- Text Object
      map({ 'o', 'x' }, 'ih', ';<C-U> Gitsigns select_hunk<CR>', 'Gitsigns select hunk')
    end,
  },
}
