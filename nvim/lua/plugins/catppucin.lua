return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-macchiato'
    require('catppuccin').setup({
      --flavour = 'macchiato',
      transparent_background = false,
    })
  end
}
