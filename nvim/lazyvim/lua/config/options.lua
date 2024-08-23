-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.guifont = "JetBrainsMono Nerd Font:h9"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.pumblend = 0

-- Neovide Config --
vim.g.neovide_fullscreen = false
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"

vim.g.neovide_transparency = 0.8
vim.g.neovide_window_blurred = true

vim.g.neovide_cursor_vfx_particle_lifetime = 2
vim.g.neovide_cursor_vfx_particle_density = 50.0

vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 2
vim.g.neovide_padding_right = 2
vim.g.neovide_padding_left = 2
