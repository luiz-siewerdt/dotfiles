local folders = { "node_modules", "build", "venv", "__pycache__", ".git" }
local cmd_str = "fd --type f "

for _, folder in pairs(folders) do
  cmd_str = cmd_str .. "--exclude " .. folder .. " "
end

return {
  "ibhagwan/fzf-lua",
  lazy = false,
  -- optional for icon support
  dependencies = { "echasnovski/mini.icons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("fzf-lua").setup({
      files = {
        cmd = cmd_str,
      },
    })
  end,
}
