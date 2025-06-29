return {
  {
    "williamboman/mason.nvim",
    event = "User StartLsp",
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "User StartLsp",
    dependencies = { "williamboman/mason.nvim" },
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
    end,
  }
}
