local M = {}


M.setup_adapters = function(dap)
  print("host")
  dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or '127.0.0.1'
      cb({
        type = 'server',
        port = 3004,
        host = host,
        options = {
          source_filetype = 'python',
        },
      })
    else
      cb({
        type = 'executable',
        command = "/home/shampoo-shrek/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
        args = { '-m', 'debugpy.adapter' },
        options = {
          source_filetype = 'python',
        },
      })
    end
  end
end

M.setup_config = function(dap)
  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = "launch file",
      program = "${file}",
      pythonpath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python'
        end
      end,
    },
    {
      type = 'python',
      request = 'launch',
      name = "Django",
      program = vim.fn.getcwd() .. "/manage.py",
      args = { "runserver" },
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python'
        end
      end,
    },
    {
      type = 'python',
      request = 'attach',
      name = 'Attach to Django in Docker',
      host = "127.0.0.1",
      port = 3004,
    },
  }
end

return M
