local M = {}

M.palette = require("umbra.palette")

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "umbra"

  require("umbra.highlights").load()
end

return M
