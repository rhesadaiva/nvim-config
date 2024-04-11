return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },

  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  -- set keybinding
  keys = {
    {
      '<leader>lg',
      '<cmd>LazyGit<cr>',
      desc = 'Open Lazy Git',
    },
  },
}
