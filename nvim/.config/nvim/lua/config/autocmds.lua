-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Register templ filetype
vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("murdr_trim_whitespace", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.expand("%") ~= "" then
      local save_cursor = vim.fn.getpos(".")
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos(".", save_cursor)
    end
  end,
})
