-- Snacks overrides: keep explorer always showing hidden files

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = false,
            jump = {
              close = true,
            },
          },
        },
      },
    },
  },
}
