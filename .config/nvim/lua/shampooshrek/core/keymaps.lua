_G.Shampoo = {}
_G.WithDesc = function(opts, desc)
  return vim.tbl_extend("force", opts, { desc = desc })
end


Shampoo.config_files = function()
  local fzf = require("fzf-lua")
  local config_location = vim.fn.stdpath("config")
  fzf.files({ cwd = config_location })
end

local delete_all_buffers = function()
  local bufferline = require("bufferline")
  for _, e in ipairs(bufferline.get_elements().elements) do
    print(vim.inspect(e))
    vim.schedule(function()
      require("bufdelete").bufdelete(e.id)
    end)
  end
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }
local map = vim.keymap

map.set("n", "<C-a>", "ggVG", opts)
map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map.set("n", "<leader>q", ":q<CR>", WithDesc(opts, "close tab"))
map.set("n", "<leader>Q", ":qa<CR>", WithDesc(opts, "close all"))

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", WithDesc(opts, "Go to Left Window"))
map.set("n", "<C-j>", "<C-w>j", WithDesc(opts, "Go to Lower Window"))
map.set("n", "<C-k>", "<C-w>k", WithDesc(opts, "Go to Upper Window"))
map.set("n", "<C-l>", "<C-w>l", WithDesc(opts, "Go to Right Window"))

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", WithDesc(opts, "Increase Window Height"))
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", WithDesc(opts, "Decrease Window Height"))
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", WithDesc(opts, "Decrease Window Width"))
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", WithDesc(opts, "Increase Window Width"))

-- Move Lines
map.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Oil --
map.set("n", "<leader>e", ":OilToggle<CR>", WithDesc(opts, "Open Explorer"))

-- Search --
map.set("n", "<leader><leader>", ":FzfLua files<CR>", WithDesc(opts, "Find"))
map.set("n", "<leader>fc", ":lua Shampoo.config_files()<CR>", WithDesc(opts, "Config Files"))
map.set("n", "<leader>fg", ":FzfLua live_grep<CR>", WithDesc(opts, "Search grep"))

-- Diagnostics --
map.set("n", "gl", vim.diagnostic.open_float, WithDesc(opts, "Open Diagnostic"))

-- BufferLine --
map.set("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
map.set("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
map.set("n", "<leader>b", "", WithDesc(opts, "Buffers"))
map.set("n", "<leader>bd", ":Bdelete<CR>", WithDesc(opts, "Delete Current Buffer"))
map.set("n", "<leader>ba", delete_all_buffers, WithDesc(opts, "Delete All Buffers"))
map.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", WithDesc(opts, "Delete Other Buffers"))

-- Lua Snippets --
map.set({ "i" }, "<C-k>", "<cmd>lua require'luasnip'.expand_or_jump()<CR>", opts)
map.set({ "i" }, "<C-h>", "<cmd>lua require'luasnip'.expand()<CR>", opts)
map.set({ "i" }, "<C-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map.set({ "i" }, "<C-j>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
