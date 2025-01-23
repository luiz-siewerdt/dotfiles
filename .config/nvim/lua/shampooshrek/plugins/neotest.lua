return {
  -- {
  --   "rcasia/neotest-java",
  --   ft = "java",
  --   dependencies = {
  --     "mfussenegger/nvim-jdtls",
  --     "mfussenegger/nvim-dap", -- for the debugger
  --     "rcarriga/nvim-dap-ui", -- recommended
  --     "theHamsta/nvim-dap-virtual-text", -- recommended
  --   },
  --   init = function()
  --     -- override the default keymaps.
  --     -- needed until neotest-java is integrated in LazyVim
  --     -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     -- run test file
  --     --   keys[#keys + 1] = {
  --     --     "<leader>tt",
  --     --     function()
  --     --       require("neotest").run.run(vim.fn.expand("%"))
  --     --     end,
  --     --     mode = "n",
  --     --   }
  --     --   -- run nearest test
  --     --   keys[#keys + 1] = {
  --     --     "<leader>tr",
  --     --     function()
  --     --       require("neotest").run.run()
  --     --     end,
  --     --     mode = "n",
  --     --   }
  --     --   -- debug test file
  --     --   keys[#keys + 1] = {
  --     --     "<leader>tD",
  --     --     function()
  --     --       require("neotest").run.run({ strategy = "dap" })
  --     --     end,
  --     --     mode = "n",
  --     --   }
  --     --   -- debug nearest test
  --     --   keys[#keys + 1] = {
  --     --     "<leader>td",
  --     --     function()
  --     --       require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
  --     --     end,
  --     --     mode = "n",
  --     --   }
  --   end,
  -- },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
    },
    opts = {
      adapters = {
        -- ["neotest-java"] = {
        --   -- config here
        -- },
        ["neotest-dotnet"] = {},
      },
    },

    keys = {
      { "<leader>t", "", desc = "test" },
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File (Neotest)",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cmd())
        end,
        desc = "Run All Test Files (Neotest)",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest (Neotest)",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last (Neotest)",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary (Neotest)",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Show Output (Neotest)",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel (Neotest)",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop (Neotest)",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Toggle Watch (Neotest)",
      },
    },
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
            discovery_root = "project", -- Default
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
  },
}
