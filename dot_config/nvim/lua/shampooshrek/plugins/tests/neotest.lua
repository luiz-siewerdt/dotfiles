local keys = require("shampooshrek.config.neotest.keys")

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "Issafalcon/neotest-dotnet",
  },
  lazy = true,
  opts = {
    adapters = {
      ["neotest-java"] = {
      },
      ["neotest-dotnet"] = {},
    },
  },

  keys = keys,
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-dotnet")({
          dap = {
            args = { justMyCode = false },
            adapter_name = "netcoredbg",
          },
          dotnet_additional_args = {
            "--verbosity normal",
          },
          discovery_root = "project",
        }),
      },
    })
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
  end,
}
