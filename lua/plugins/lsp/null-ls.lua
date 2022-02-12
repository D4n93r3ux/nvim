local M = {}

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  print("Failed to configure null-ls")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local settings = {
  sources = {
    formatting.stylua,
  },
}

M.config = function()
  null_ls.setup(settings)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

return M
