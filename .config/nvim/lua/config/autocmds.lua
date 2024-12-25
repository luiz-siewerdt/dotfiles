require("telescope").load_extension("projects")

-- local jdtls = require("functions.jdtls")
-- local java_filetypes = { "java" }

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = java_filetypes,
--   callback = jdtls.setup_jdtls,
-- }

vim.diagnostic.config({
  virtual_text = false, -- Disable inline text (optional)
  signs = true, -- Enable signs in the gutter
  underline = true, -- Enable underlines for diagnostics
})
