local config = require("shampooshrek.config.lsp.utils.conf")
local languages = require("shampooshrek.config.lsp.servers.servers")

return {
  {
    "hoffs/omnisharp-extended-lsp.nvim",
    lazy = false
    -- lazy = true,
    -- ft = { "csharp", "cs", "c#" }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "User StartLsp",
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
