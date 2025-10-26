return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  opts = {
    snippets = { preset = "luasnip" },
    keymap = { preset = "enter" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "codeium" },
      providers = {
        codeium = { name = "Codeium", module = "codeium.blink", async = true },
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },
  },
}
