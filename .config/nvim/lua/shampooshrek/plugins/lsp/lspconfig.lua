local signature_conf = {
  floating_window_off_x = 10,
  max_width = 100,
  bind = true,
  handler_opts = {
    border = "rounded"
  }
}

return {
  "neovim/nvim-lspconfig",
  depencencies = {
    "saghen/blink.cmp",
    "ray-x/lsp_signature.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  opts = {
    servers = {
      html = {},
      -- pyright = {},
      pylsp = {},
      -- pylint = {},
      bashls = {},
      css_variables = {},
      cssls = {},
      tailwindcss = {},
      eslint = {},
      ts_ls = {},
      jsonls = {},
      clangd = {},
      powershell_es = {
        bundle_path = vim.fn.expand("~") .. "/.local/share/nvim/mason/packages/powershell-editor-services",
        shell = "pwsh", -- ou "powershell" se você estiver no Windows
      },
      docker_compose_language_service = {},
      dockerls = {},
      sqlls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = "vim",
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      },
      -- jdtls = {
      -- 	keys = {
      -- 		-- nvim jdtls --
      -- 		{ "<leader>jc", "<cmd>JCgenerateConstructor<CR>", desc = "Generate constructor" },
      -- 		{ "<leader>jd", "<cmd>JCgenerateConstructorDefault<CR>", desc = "Generate default constructor" },
      -- 		{ "<leader>jn", "<cmd>JCgenerateClass<CR>", desc = "Generate new class" },
      -- 		{ "<leader>jA", "<cmd>JCgenerateAccessors<CR>", desc = "Generate accessors" },
      -- 		{ "<leader>jag", "<cmd>JCgenerateAccessorGetter<CR>", desc = "Generate getter" },
      -- 		{ "<leader>jas", "<cmd>JCgenerateAccessorSetter<CR>", desc = "Generate setter" },
      -- 		{ "<leader>jaa", "<cmd>JCgenerateAccessorSetterGetter<CR>", desc = "Generate setter getter" },
      -- 	},
      -- },
      omnisharp = {
        cmd = { "omnisharp" },
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
      },
    },
  },
  config = function(_, opts)
    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      local with_table = function(desc)
        return vim.tbl_extend("force", bufopts, { desc = desc })
      end
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, with_table("goto declaration"))
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, with_table("goto definition"))
      vim.keymap.set("n", "K", vim.lsp.buf.hover, with_table("hover"))
      vim.keymap.set("n", "gr", vim.lsp.buf.references, with_table("references"))
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, with_table("code actions"))
      require "lsp_signature".on_attach(signature_conf, bufnr)
    end

    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end
  end,
}
