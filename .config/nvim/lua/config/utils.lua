local M = {}

function M.toggle_neovide_transparence()
  if vim.g.neovide_transparency == 1 or vim.g.neovide_transparency == nil then
    vim.g.neovide_transparency = 0.95
  else
    vim.g.neovide_transparency = 1
  end
end

function M.toggle_full_screen()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end

return M
