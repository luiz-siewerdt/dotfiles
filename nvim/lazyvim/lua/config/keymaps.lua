-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Normal mode keybindings
--

local opts = { noremap = true, silent = true }
local map = LazyVim.safe_keymap_set
local del = vim.keymap.del

local function toggle_neovide_transparence()
  if vim.g.neovide_transparency == 1 or vim.g.neovide_transparency == nil then
    vim.g.neovide_transparency = 0.95
  else
    vim.g.neovide_transparency = 1
  end
end

local function toggle_full_screen()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })
vim.keymap.set("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<C-s>", ":w!<CR>", opts)
vim.keymap.set("n", "<M-b>", ":lua CloseBuffers()<CR>", opts)
vim.keymap.set("n", "<M-1>", ":ToggleTerm direction=horizontal<CR>", opts)
vim.keymap.set("n", "<M-3>", ":ToggleTerm direction=float<CR>", opts)

map("n", "<leader>q", ":q<CR>", { desc = "Close Buffer" })
map("n", "<leader>Q", ":qa<CR>", { desc = "Close Window" })
map("n", "<leader>c", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "<leader>r", ":IncRename ", { desc = "INC Rename" })

vim.keymap.set("v", "<Tab>", "=", opts)

map("n", "<M-Enter>", toggle_full_screen, opts)
map("n", "<M-t>", toggle_neovide_transparence, opts)
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader>ja", "", { desc = "Accessors" })
map("n", "<leader>j", "", { desc = "Java" })

-- DISABLE KEYMAPS

-- window
-- del("n", "<leader>ww")
-- del("n", "<leader>wd")
-- del("n", "<leader>w-")
-- del("n", "<leader>w|")
-- del("n", "<leader>-")
-- del("n", "<leader>|")
-- del("n", "<leader>wm")

-- tabs
del("n", "<leader><tab>o")
del("n", "<leader><tab>l")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")

-- UI
del("n", "<leader>ub")
del("n", "<leader>uf")
del("n", "<leader>uF")
del("n", "<leader>ul")
del("n", "<leader>uL")
del("n", "<leader>uh")
del("n", "<leader>ui")
del("n", "<leader>uI")
del("n", "<leader>up")
del("n", "<leader>un")
