local M = {}

M.signature_conf = {
  floating_window_off_x = 10,
  max_width = 100,
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}

M.setup = function(_, opts)
  local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local with_table = function(desc)
      return vim.tbl_extend("force", bufopts, { desc = desc })
    end
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, with_table("goto declaration"))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, with_table("goto definition"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, with_table("hover"))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, with_table("references"))
    require("lsp_signature").on_attach(M.signature_conf, bufnr)
  end

  for server, config in pairs(opts.servers) do
    config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    config.on_attach = on_attach
    vim.lsp.config(server, config)
  end

  vim.diagnostic.config {
    float = { border = "rounded" }
  }
end

return M
