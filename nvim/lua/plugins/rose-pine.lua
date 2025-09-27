return {
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
          bold = true,
          italic = false, -- disable global italics
        },
        highlight_groups = {
          Comment = { italic = true }, -- only comments italic
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
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
