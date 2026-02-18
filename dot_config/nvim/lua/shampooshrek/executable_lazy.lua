local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    os.exit(1)
    vim.fn.getchar()
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "shampooshrek.plugins.ui" },
  { import = "shampooshrek.plugins.utils" },
  { import = "shampooshrek.plugins.editor" },
  { import = "shampooshrek.plugins.coding" },
  { import = "shampooshrek.plugins.colorschemes" },
  { import = "shampooshrek.plugins.lsp" },
}, {
  install = {
    colorscheme = { "material" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})


vim.cmd([[colorscheme material-deep-ocean]])
