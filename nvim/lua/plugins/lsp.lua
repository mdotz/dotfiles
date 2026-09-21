return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local mason_lspconfig = require("mason-lspconfig")
      local servers = {
      }

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      vim.lsp.config('ts_ls', {
        settings = {
          logging = {
            -- Enables logging to a file
            file = vim.fn.stdpath("cache") .. "/typescript-tools.log",
            -- Log level, can be "debug", "info", "warn", "error"
            level = "debug"
          }
        }
      })
      vim.lsp.enable('ts_ls')

      vim.lsp.config('ruby_lsp', {
        init_options = {
          formatter = 'rubocop',
          linters = { 'rubocop' },
        },
      })
      vim.lsp.enable('ruby_lsp')

      local builtin = require('telescope.builtin')

      vim.keymap.set("n", "X", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      -- vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
      -- vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    end
  },
  --{
    --"pmizio/typescript-tools.nvim",
    --dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --opts = {},
  --},
}
