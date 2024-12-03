return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- First, disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('neo-tree').setup({
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
      close_if_last_window = true,
      filesystem = {
        hijack_netrw_behavior = 'open_default', -- 'open_current' or 'open_default'
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false
        }
      }
    })

    vim.keymap.set('n', '<leader>e', ':Neotree reveal<CR>', { desc = 'Reveal file in Neotree' })
    vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', { desc = 'Toggle Neotree' })
  end
}
