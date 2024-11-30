-- function NeoTreeTrash()
--   local neo_tree = require("neo-tree")
--   local lib = require("neo-tree.sources.manager")
--   local node = lib.get_node()
--
--   if not node then
--     print("No node found at cursor")
--     return
--   end
--
--   local trash_cmd = "trash "
--
--   local function get_user_input_char()
--     local c = vim.fn.getchar()
--     return vim.fn.nr2char(c)
--   end
--
--   -- Exibir a mensagem de confirmação para o usuário
--   print("Trash " .. node.name .. " ? y/n")
--
--   -- Captura a entrada do usuário
--   if get_user_input_char():match("^y") then
--     -- Inicia o comando de trash e atualiza a árvore após a execução
--     vim.fn.jobstart(trash_cmd .. node.path, {
--       detach = true,
--       on_exit = function(job_id, data, event)
--         require("neo-tree.sources.manager").refresh()
--       end,
--     })
--   end
--
--   -- Garantir que o modo normal esteja ativado
--   vim.api.nvim_command("normal :esc<CR>")
-- end

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>E", false },
    -- { "<leader>e", false },
  },
  opts = {
    window = {
      mappings = {
        -- ["d"] = NeoTreeTrash(),
      },
    },
  },
}
