-- Simplified: single official Catppuccin theme with integrations.
-- If you later want more themes, restore a helper or add new spec files.

-- Backwards compatibility: keep ColorMyPencils (no-op wrapper now)
function ColorMyPencils()
  vim.cmd.colorscheme("catppuccin")
end

-- Flavour cycle helper (optional)
local flavours = { "mocha", "macchiato", "frappe", "latte" }
local idx = 1
local function apply(flavour)
  local ok = pcall(function()
    require("catppuccin").setup({
      flavour = flavour,
      transparent_background = true,
      integrations = {
        treesitter = true,
        gitsigns = true,
        telescope = true,
        dap = true,
        cmp = true,
        native_lsp = { enabled = true },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end)
  if ok then
    pcall(vim.api.nvim_set_hl, 0, "Normal", { bg = "none" })
    pcall(vim.api.nvim_set_hl, 0, "NormalFloat", { bg = "none" })
  end
end

vim.api.nvim_create_user_command("CatppuccinCycle", function()
  idx = (idx % #flavours) + 1
  apply(flavours[idx])
  vim.notify("Catppuccin: " .. flavours[idx], vim.log.levels.INFO)
end, { desc = "Cycle Catppuccin flavour" })

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      apply("mocha") -- default
    end,
  },
}
