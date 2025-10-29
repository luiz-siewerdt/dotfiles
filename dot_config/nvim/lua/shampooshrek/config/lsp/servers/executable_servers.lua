local powershell_conf = require("shampooshrek.config.lsp.servers.powershell")
local java_conf = require("shampooshrek.config.lsp.servers.java")
local lua_conf = require("shampooshrek.config.lsp.servers.lua")
local omnisharp_conf = require("shampooshrek.config.lsp.servers.omnisharp")

local M = {}

M.servers = {
  html = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          flake8 = { enabled = false },
        },
        configurationSources = {}, -- Disable all configuration sources
        format = false,            -- Disable formatting
      },
    },
  },
  cssls = {},
  sqlls = {},
  -- ts_ls = {},
  bashls = {},
  eslint = {},
  jsonls = {},
  clangd = {},
  dockerls = {},
  tailwindcss = {},
  css_variables = {},
  rust_analyzer = {},
  terraformls = {},
  intelephense = {},
  sqlls = {},
  lua_ls = lua_conf,
  jdtls = java_conf,
  omnisharp = omnisharp_conf,
  powershell_es = powershell_conf,
  docker_compose_language_service = {},
}

return M
