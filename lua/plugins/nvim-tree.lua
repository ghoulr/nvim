return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
    { "<leader>E", "<cmd>NvimTreeFocus<cr>", desc = "Focus File Explorer" },
  },
  config = function()
    require("nvim-tree").setup({
      view = { width = 35 },
      git = { enable = true },
      diagnostics = { enable = true },
      renderer = { icons = { show = { git = true, folder = true, file = true } } },
    })
  end,
}
