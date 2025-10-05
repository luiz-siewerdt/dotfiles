local folders = { "node_modules", "build", "venv", "__pycache__", ".git", "vendor" }
local cmd_str = "fd --type f "

for _, folder in pairs(folders) do
  cmd_str = cmd_str .. "--exclude " .. folder .. " "
end

return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("fzf-lua").setup({
      files = {
        cmd = cmd_str,
      },
    })
  end,
}
