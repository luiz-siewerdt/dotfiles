return {
  "neovim/nvim-lspconfig",
  opts = {

    servers = {
      jdtls = {
        keys = {
          -- nvim jdtls --
          { "<leader>jc", "<cmd>JCgenerateConstructor<CR>", desc = "Generate constructor" },
          { "<leader>jd", "<cmd>JCgenerateConstructorDefault<CR>", desc = "Generate default constructor" },
          { "<leader>jn", "<cmd>JCgenerateClass<CR>", desc = "Generate new class" },
          { "<leader>jA", "<cmd>JCgenerateAccessors<CR>", desc = "Generate accessors" },
          { "<leader>jag", "<cmd>JCgenerateAccessorGetter<CR>", desc = "Generate getter" },
          { "<leader>jas", "<cmd>JCgenerateAccessorSetter<CR>", desc = "Generate setter" },
          { "<leader>jaa", "<cmd>JCgenerateAccessorSetterGetter<CR>", desc = "Generate setter getter" },
        },
      },
      --   omnisharp = {
      --     handlers = {
      --       ["textDocument/definition"] = function(...)
      --         return require("omnisharp_extended").handler(...)
      --       end,
      --     },
      --     keys = {
      --       {
      --         "gd",
      --         LazyVim.has("telescope.nvim") and function()
      --           require("omnisharp_extended").telescope_lsp_definitions()
      --         end or function()
      --           require("omnisharp_extended").lsp_definitions()
      --         end,
      --         desc = "Goto Definition",
      --       },
      --     },
      --     enable_roslyn_analyzers = true,
      --     organize_imports_on_format = true,
      --     enable_import_completion = true,
      --   },
    },
  },
}
