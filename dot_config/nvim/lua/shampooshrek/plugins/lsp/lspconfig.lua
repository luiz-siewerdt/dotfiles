local config = require("shampooshrek.config.lsp.utils.conf")
local languages = require("shampooshrek.config.lsp.servers.servers")

return {
  {
    "hoffs/omnisharp-extended-lsp.nvim",
    lazy = true,
    event = "LspAttach"
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile", "SessionLoadPost" },
    dependencies = {
      "saghen/blink.cmp",
      "ray-x/lsp_signature.nvim",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    opts = {
      servers = languages.servers,
    },
    config = config.setup
  }
}
