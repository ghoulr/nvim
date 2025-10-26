return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = { "ruff", "pyright", "ts_ls", "svelte", "tailwindcss", "gopls" }
    for _, lsp in ipairs(servers) do
      vim.lsp.enable(lsp)
    end
  end,
}
