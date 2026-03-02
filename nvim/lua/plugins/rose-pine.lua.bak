return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
          bold = true,
          italic = false,
        },

        highlight_groups = {
          Comment = { italic = true },
          Keyword = { italic = false },
          Type = { italic = false },
          Function = { italic = false },
          Variable = { italic = false },
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "rose-pine" },
  },
}
