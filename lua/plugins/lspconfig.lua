return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local servers = { "ruff", "pyright", "ts_ls", "svelte", "tailwindcss", "gopls" }
    local ok, blink = pcall(require, "blink.cmp")
    if ok then
      vim.lsp.config("*", { capabilities = blink.get_lsp_capabilities() })
    end
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
