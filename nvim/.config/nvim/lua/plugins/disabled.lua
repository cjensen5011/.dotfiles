return {
  { "akinsho/bufferline.nvim", enabled = false }, -- fancy tabs
  { "folke/noice.nvim", enabled = false }, -- pop up stuff
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- inlay hints
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false }, -- disable indent guides
      scroll = { enabled = false }, -- disable smooth scrolling
      animate = { enabled = false }, -- disable animations
    },
  },
}
