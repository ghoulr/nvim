local disabled_filetypes = { markdown = true, text = true }

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
    keymap = {
      preset = "enter",
      ["<C-n>"] = {
        function(cmp)
          cmp.show()
        end,
        "select_next",
      },
    },
    sources = {
      default = { "lsp", "codeium", "path", "snippets", "buffer" },
      providers = {
        codeium = { name = "Codeium", module = "codeium.blink", async = true, max_items = 5 },
      },
    },
    completion = {
      menu = {
        auto_show = function(ctx)
          return not disabled_filetypes[vim.bo[ctx.bufnr].filetype]
        end,
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },
  },
}
