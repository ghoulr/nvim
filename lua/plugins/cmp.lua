return {
  "hrsh7th/nvim-cmp",         -- 补全引擎核心
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",   -- LSP 补全源
    "L3MON4D3/LuaSnip",       -- 片段引擎
    "saadparwaiz1/cmp_luasnip", -- LuaSnip 补全源
    "hrsh7th/cmp-buffer",     -- buffer 补全源
    "hrsh7th/cmp-path",       -- path 补全源
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
--        { name = "codeium" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}

