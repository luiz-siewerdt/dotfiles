_G.Shampoo = {}

_G.WithDesc = function(opts, desc)
  return vim.tbl_extend("force", opts, { desc = desc })
end


Shampoo.config_files = function(changeCWD)
  local fzf = require("fzf-lua")
  local config_location = vim.fn.stdpath("config")
  fzf.files({ cwd = config_location })

  if changeCWD then
    vim.fn.chdir(config_location)
  end
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

-- #region Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", WithDesc(opts, "Go to Left Window"))
map.set("n", "<C-j>", "<C-w>j", WithDesc(opts, "Go to Lower Window"))
map.set("n", "<C-k>", "<C-w>k", WithDesc(opts, "Go to Upper Window"))
map.set("n", "<C-l>", "<C-w>l", WithDesc(opts, "Go to Right Window"))
-- #endregion

-- #region Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", WithDesc(opts, "Increase Window Height"))
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", WithDesc(opts, "Decrease Window Height"))
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", WithDesc(opts, "Decrease Window Width"))
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", WithDesc(opts, "Increase Window Width"))
-- #endregion

-- #region Move Lines
map.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
-- #endregion

-- #region Oil --
map.set("n", "<leader>e", ":OilToggle<CR>", WithDesc(opts, "Open Explorer"))
-- #endregion

-- #region Search --
map.set("n", "<leader>fc", ":lua Shampoo.config_files()<CR>", WithDesc(opts, "Config Files"))

map.set("n", "<leader><leader>", ":FzfLua files<CR>", WithDesc(opts, "Find"))
map.set("n", "<leader>fg", ":FzfLua live_grep<CR>", WithDesc(opts, "Search grep"))

map.set("n", "<leader>fdw", ":FzfLua lsp_workspace_diagnostics<CR>", WithDesc(opts, "Workspace Diagnostics"))
map.set("n", "<leader>fdd", ":FzfLua lsp_document_diagnostics<CR>", WithDesc(opts, "Document Diagnostics"))

map.set("n", "<leader>fb", ":FzfLua buffers<CR>", WithDesc(opts, "Buffers"))

map.set("n", "<leader>fr", ":FzfLua lsp_references<CR>", WithDesc(opts, "References"))
map.set("n", "<leader>ff", ":FzfLua lsp_finder<CR>", WithDesc(opts, "Finder"))
map.set("n", "<leader>fs", ":FzfLua lsp_document_symbols<CR>", WithDesc(opts, "Document Symbols"))

map.set("n", "<leader>fp", ":FzfLua dap_breakpoints<CR>", WithDesc(opts, "Breakpoints"))

map.set("n", "<leader>ft", ":FzfLua colorschemes<CR>", WithDesc(opts, "colorschemes"))
map.set("n", "<leader>fT", ":FzfLua awesome_colorschemes<CR>", WithDesc(opts, "awesome colorschemes"))
-- #endregion

-- #region Diagnostics --
map.set("n", "gl", vim.diagnostic.open_float, WithDesc(opts, "Open Diagnostic"))
-- #endregion

-- #region BufferLine --
map.set("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
map.set("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
map.set("n", "<leader>b", "", WithDesc(opts, "Buffers"))
map.set("n", "<leader>bd", ":Bdelete<CR>", WithDesc(opts, "Delete Current Buffer"))
map.set("n", "<leader>ba", delete_all_buffers, WithDesc(opts, "Delete All Buffers"))
map.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", WithDesc(opts, "Delete Other Buffers"))
-- #endregion

-- #region Lua Snippets --
map.set({ "i" }, "<C-k>", "<cmd>lua require'luasnip'.expand_or_jump()<CR>", opts)
map.set({ "i" }, "<C-h>", "<cmd>lua require'luasnip'.expand()<CR>", opts)
map.set({ "i" }, "<C-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map.set({ "i" }, "<C-j>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


map.set("n", "K", function()
  local peek_win_fold = vim.g.peek_fold_id

  if peek_win_fold and vim.api.nvim_win_is_valid(peek_win_fold) then
    vim.api.nvim_set_current_win(peek_win_fold)
    return
  end

  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if winid then
    vim.g.peek_fold_id = winid
    return
  end

  vim.lsp.buf.hover()
end)

-- #endregion

-- #region API Rest --
map.set("n", "<leader>rr", "<cmd>lua require('kulala').run()<CR>", WithDesc(opts, "Send current request"))
map.set("n", "<leader>ra", "<cmd>lua require('kulala').run_all()<CR>", WithDesc(opts, "Send all requests"))
map.set("n", "<leader>rs", "<cmd>lua require('kulala').show_stats()<CR>", WithDesc(opts, "Show request stats"))
map.set("n", "<leader>ri", "<cmd>lua require('kulala').inspect()<CR>", WithDesc(opts, "Inspect current request"))
-- map.set("n", "<leader>rrr", "<cmd>lua require('kulala').replay()<CR>", WithDesc(opts, "Replay last request"))
map.set("n", "<leader>rn", "<cmd>lua require('kulala').jump_next()<CR>", WithDesc(opts, "Jump to next request"))
map.set("n", "<leader>rp", "<cmd>lua require('kulala').jump_prev()<CR>", WithDesc(opts, "Jump to previous request"))
map.set("n", "<leader>rf", "<cmd>lua require('kulala').search()<CR>", WithDesc(opts, "Find request in file"))

map.set("n", "<leader>re", "<cmd>lua require('kulala').set_selected_env()<CR>",
  WithDesc(opts, "Select request environment"))

map.set("n", "<leader>rc", "<cmd>lua require('kulala').copy()<CR>", WithDesc(opts, "Copy request as cURL"))
map.set("n", "<leader>rC", "<cmd>lua require('kulala').from_curl()<CR>", WithDesc(opts, "Paste request from cURL"))

map.set("n", "<leader>rg", "<cmd>lua require('kulala').download_graphql_schema()<CR>",
  WithDesc(opts, "Download GraphQL schema"))

map.set("n", "<leader>ru", "<cmd>lua require('lua.kulala.ui.auth_manager').open_auth_config()<CR>",
  WithDesc(opts, "Manage auth config"))

map.set("n", "<leader>rx", "<cmd>lua require('kulala').scripts_clear_global()<CR>",
  WithDesc(opts, "Clear global variables"))

map.set("n", "<leader>rX", "<cmd>lua require('kulala').clear_cached_files()<CR>", WithDesc(opts, "Clear cached files"))
map.set("n", "<leader>ro", "<cmd>lua require('kulala').open()<CR>", WithDesc(opts, "Open Kulala window"))
map.set("n", "<leader>rb", "<cmd>lua require('kulala').scratchpad()<CR>", WithDesc(opts, "Open scratchpad"))
map.set("n", "<leader>rt", "<cmd>lua require('kulala').toggle_view()<CR>", WithDesc(opts, "Toggle headers/body"))
map.set("n", "<leader>rq", "<cmd>lua require('kulala').close()<CR>", WithDesc(opts, "Close Kulala window"))

-- #endregion

-- LSP --
map.set("n", "<leader>ca", ":FzfLua lsp_code_actions<CR>", WithDesc(opts, "Code Actions"))


-- #region NVIM TREESITTER TEXT OBJECTS --

map.set({ "x", "o" }, "am", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
map.set({ "x", "o" }, "im", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
map.set({ "x", "o" }, "ac", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
map.set({ "x", "o" }, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
map.set({ "x", "o" }, "as", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
end)

map.set("n", "]f", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer")
end)

map.set("n", "[f", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer")
end)

map.set("n", "]c", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer")
end)

map.set("n", "[c", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer")
end)

--#endregion

-- #region SURROUND --
vim.g.nvim_surround_no_normal_mappings = true

map.set("n", "sa", "<Plug>(nvim-surround-normal)", {
  desc = "Add a surrounding pair around a motion (normal mode)",
})
map.set("n", "sd", "<Plug>(nvim-surround-delete)", {
  desc = "Delete a surrounding pair",
})
map.set("n", "sc", "<Plug>(nvim-surround-change)", {
  desc = "Change a surrounding pair",
})
-- #endregion
