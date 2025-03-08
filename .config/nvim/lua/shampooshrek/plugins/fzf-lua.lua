local folders = { "node_modules", "build", "venv" }
local cmd_str = "fd --type f "

for _, folder in pairs(folders) do
  cmd_str = cmd_str .. "--exclude " .. folder .. " "
end

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
