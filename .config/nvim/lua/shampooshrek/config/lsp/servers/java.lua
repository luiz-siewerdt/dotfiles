return {
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
}
