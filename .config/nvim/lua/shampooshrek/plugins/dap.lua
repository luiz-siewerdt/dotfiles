return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
      -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
      { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
      { "<leader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
    },

    config = function()
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end
    end,

    opts = function()
      local dap = require("dap")
      for _, adapterType in ipairs({ "node", "chrome" }) do
        local pwaType = "pwa-" .. adapterType

        dap.adapters[pwaType] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }

        dap.adapters[adapterType] = function(cb, config)
          local nativeAdapter = dap.adapters[pwaType]

          config.type = pwaType

          if type(nativeAdapter) == "function" then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      local enter_launch_url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file using Node.js (nvim-dap)",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process using Node.js (nvim-dap)",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file using Node.js with ts-node/register (nvim-dap)",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeArgs = { "-r", "ts-node/register" },
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome (nvim-dap)",
            url = enter_launch_url,
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
            -- runtimeExecutable = "/usr/bin/google-chrome-stable",
            runtimeArgs = {
              "--user-data-dir=/home/shampoo-shrek/.config/google-chrome/remote-debug-profile",
              "--remote-debugging-port=9222",
            }
          },
          {
            type = "pwa-chrome",
            request = "attach",
            name = "Attach Chrome (nvim-dap)",
            port = 9222
            -- runtimeExecutable = "/usr/bin/google-chrome-stable",
            -- runtimeArgs = {
            --   "--user-data-dir=remote-debug-profile",
            --   "--remote-debugging-port=${port}",
            -- }
          }
        }
      end
    end,
  },
}
