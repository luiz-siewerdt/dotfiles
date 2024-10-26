local jdtls = require("functions.jdtls")
local java_filetypes = { "java" }

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = java_filetypes,
--   callback = jdtls.setup_jdtls,
-- })

require("telescope").load_extension("projects")
