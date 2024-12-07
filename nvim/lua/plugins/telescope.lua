return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  config = function()
    require("telescope").setup {
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return {"--hidden"}
          end
        },
      },
    }
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', builtin.find_files, {})
    vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end
}
