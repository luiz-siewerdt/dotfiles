-- local omn = require("omnisharp_extended")

return {
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
    ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
    ["textDocument/references"] = require("omnisharp_extended").references_handler,
    ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
  },
  keys = {
    {
      "gd",
      function()
        require("omnisharp_extended").lsp_definitions()
      end,
      desc = "Goto Definition",
    },
  },
}
