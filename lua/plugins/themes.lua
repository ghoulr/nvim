return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function() 
      require("catppuccin").setup({
        flavor = "mocha"
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "main",
        styles = {
          bold = false,
          italic = false,
          transparency = false
        }
      })
    end,
  }
}
