local themes = {
  tokyo = "tokyonight-moon",
  kana = "kanagawa",
  rose = "rose-pine-moon",
}
local theme = themes.rose
-- local theme = "kanagawa"
-- local theme = "tokyonight-moon"

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(theme)
    end,
  },

}
