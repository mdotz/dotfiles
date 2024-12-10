-- return {
  -- "neovim/nvim-lspconfig",
  -- config = function()
    -- local lspconfig = require('lspconfig')
    -- lspconfig.ruby_lsp.setup({})
    -- lspconfig.pyright.setup({})
-- 
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    -- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    -- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
  -- end
-- }

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
  -- {
    -- "neovim/nvim-lspconfig",
    -- lazy = false,
    -- config = function()
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- 
      -- local lspconfig = require("lspconfig")
      -- lspconfig.ruby_lsp.setup({
        -- capabilities = capabilities,
        -- cmd = { "/Users/marcin/.asdf/shims/ruby-lsp" }
      -- })
      -- lspconfig.html.setup({
        -- capabilities = capabilities
      -- })
      -- lspconfig.lua_ls.setup({
        -- capabilities = capabilities
      -- })
-- 
      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      -- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    -- end,
  -- },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local mason_lspconfig = require("mason-lspconfig")
      local servers = {
        ruby_lsp = {},
      }

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end
      }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    end
  }
}
