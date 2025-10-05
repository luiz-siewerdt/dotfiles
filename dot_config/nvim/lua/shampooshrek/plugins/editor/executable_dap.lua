local js_conf = require("shampooshrek.config.dap.languages.javascript")
local py_conf = require("shampooshrek.config.dap.languages.python")
local keys = require("shampooshrek.config.dap.keys")

return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    lazy = false,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

    keys = keys,

    config = function()
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end
    end,

    opts = function()
      local dap = require("dap")
      js_conf.setup_adapters(dap)
      js_conf.setup_config(dap)

      py_conf.setup_adapters(dap)
      py_conf.setup_config(dap)
    end,
  },
}
