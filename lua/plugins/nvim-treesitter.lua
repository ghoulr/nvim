return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "svelte",
        "typescript",
        "javascript",
        "html",
        "tsx",
        "css",
        "scss",
        "json",
        "yaml",

        "python",
        "ruby",
        "rust",
        "go",

        "lua",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = { enable = true },
      autotag = { enable = true },
    })
  end,
}
