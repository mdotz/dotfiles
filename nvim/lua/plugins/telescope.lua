return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'nvim-telescope/telescope-fzf-native.nvim',
    { 
      "princejoogie/dir-telescope.nvim",
      config = function()
        require("dir-telescope").setup({
          -- optional configuration
          hidden = true,
          no_ignore = false,
          show_preview = true,
        })
      end,
    },
  },
  config = function()
    require("telescope").setup {
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return {"--hidden"}
          end
        },
        lsp_references = {
          path_display = { "smart" }
        }
      },
    }
    local builtin = require('telescope.builtin')
    require("telescope").load_extension("dir")

    vim.keymap.set('n', '<leader>f', builtin.find_files, {})
    vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})

    vim.keymap.set('n', '<leader>rd', ":Telescope dir live_grep<CR>", { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fd', ":Telescope dir find_files<CR>", { noremap = true, silent = true })
  end
}
