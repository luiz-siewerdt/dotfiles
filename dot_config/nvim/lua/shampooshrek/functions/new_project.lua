local scan = require('plenary.scandir')

local Layout = require('nui.layout')
local Popup = require('nui.popup')
local Menu = require('nui.menu')

local M = {}

local function list_projects(user_callback)
  local project_folder = os.getenv("DEV")

  if not project_folder then
    print("Variável DEV não definida! Use: export DEV=/seu/caminho")
    return
  end

  local projects = {}

  scan.scan_dir_async(project_folder, {
    only_dirs = true,         -- só diretórios
    respect_gitignore = true, -- ignora .gitignore
    hidden = false,           -- opcional: ignore .git, etc
    depth = 3,
    search_pattern = "/src$",

    on_insert = function(entry)
      local path_end, _ = string.find(entry, "/src")
      local path_project = string.sub(entry, string.len(project_folder) + 2, path_end or 0)
      table.insert(projects, path_project)
    end,

    on_exit = function()
      if user_callback then
        user_callback(projects)
      end
    end,
  })
end

function M.Projects()
  local menu = nil

  local render_menu = function(items)
    if menu then
      menu:umount()
    end

    menu = Menu({
      position = "50%",
      size = { width = 60, height = 20 },
      border = { style = "rounded", text = { top = " Projetos" } },
      win_options = { winhighlight = "Normal:Normal,FloatBorder:Normal" },
    }, {
      lines = items,
      keymap = {
        focus_next = { "j", "<Down>" },
        focus_prev = { "k", "<Up>" },
        close = { "q", "<Esc>" },
        submit = { "<CR>" },
      },
      on_submit = function(item)
        vim.cmd("cd " .. item.path)
        vim.cmd("edit .")
        vim.notify("Abriu: " .. item.text)
      end,
    })

    menu:mount()
  end

  list_projects(function(data)
    vim.schedule(function()
      local menu_items = {}

      for _, path in ipairs(data) do
        table.insert(menu_items, Menu.item(path))
      end

      render_menu(menu_items)
    end)
  end)
end

return M
