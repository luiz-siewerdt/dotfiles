return {

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "SessionLoadPost", "BufReadPre", "BufNewFile", },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "bashls",
          "clangd",
          "cssls",
          "css_variables",
          "docker_compose_language_service",
          "html",
          "jsonls",
          "lua_ls",
          "powershell_es",
          "pylsp",
          "tailwindcss",
          "ts_ls",
        },
      })
    end
  },
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
      local mason = require("mason")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  }
}
