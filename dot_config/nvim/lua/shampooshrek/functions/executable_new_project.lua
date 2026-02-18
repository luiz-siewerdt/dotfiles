local scan = require('plenary.scandir')

local Menu = require('nui.menu')
local Input = require("nui.input")
local event = require('nui.utils.autocmd').event

local input_popup_options = {
  relative = "editor",
  position = { row = 4, col = "50%" },
  size = 20,
  border = {
    style = "rounded",
  },
  win_options = {
    winhighlight = "Normal:Normal"
  }
}

local M = {}

local function list_projects(input_value, user_callback)
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
    search_pattern = { "/src$", input_value },

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
  local function menu_props(items)
    return Menu({
      relative = "editor",
      position = { row = 8, col = "50%" }, -- 3 linhas abaixo do input
      size = { width = 60, height = 20 },
      border = { style = "rounded", text = { top = " Projetos" } },
      win_options = { winhighlight = "Normal:Normal,FloatBorder:Normal" },
    }, {
      lines = items or {},
      keymap = {
        focus_next = { "<C-j>", "<Down>" },
        focus_prev = { "<C-k>", "<Up>" },
        close = { "q", "<Esc>" },
        submit = { "<CR>" },
      },
      on_submit = function(item)
        vim.cmd("cd " .. item.path)
        vim.cmd("edit .")
        vim.notify("Abriu: " .. item.text)
      end,
    })
  end

  local menu = menu_props({})

  local callback = function(value)

  end

  local input = Input(input_popup_options, {
    prompt = "> ",
    default_value = "43",
    on_close = function()
      print("Input clodes")
    end,
    on_submit = function(value)
      print("value submitted:", value)
    end,
    on_change = function(value)
      callback(value)
    end
  })

  input:on(event.WinClosed, function()
    input.winid = nil
  end)

  local render_menu = function(items)
    if menu then menu:unmount() end

    menu = menu_props(items)

    menu:mount()

    vim.schedule(function()
      if input and input.winid and vim.api.nvim_win_is_valid(input.winid) then
        vim.api.nvim_set_current_win(input.winid)
      end
    end)
  end

  local function onChange(input_value)
    list_projects(input_value, function(data)
      vim.schedule(function()
        local menu_items = {}

        for _, path in ipairs(data) do
          table.insert(menu_items, Menu.item(path))
        end

        render_menu(menu_items)
      end)
    end)
  end

  input:mount()
  menu:mount()

  callback = onChange
  callback("")
end

return M
