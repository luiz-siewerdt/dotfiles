local utils = require("shampooshrek.config.dap.utils")
local M = {}

M.setup_adapters = function(dap)
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
end

M.setup_config = function(dap)
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
        url = utils.enter_launch_url,
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        runtimeArgs = {
          "--user-data-dir=/home/shampoo-shrek/.config/google-chrome/remote-debug-profile",
          "--remote-debugging-port=9222",
        },
      },
      {
        type = "pwa-chrome",
        request = "attach",
        name = "Attach Chrome (nvim-dap)",
        port = 9222,
      },
    }
  end
end

return M
