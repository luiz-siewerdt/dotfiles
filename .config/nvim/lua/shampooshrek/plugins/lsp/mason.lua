return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", config = function() end },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "uga",
          package_pending = "uba",
          package_uninstalled = "uta",
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "csharp_ls",
        "clangd"
      },
      automatic_installation = true,
    })
  end,
}

