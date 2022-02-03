local M = {}

local settings = {}

M.config = function()
  local status_ok, autopairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    print "Failed to load autopairs"
    return
  end

  autopairs.setup(settings)
end

return M
