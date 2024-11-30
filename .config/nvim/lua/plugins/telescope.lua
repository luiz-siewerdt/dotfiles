return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    { "<leader>:", false },
    { "<leader>,", false },
    { "<leader>`", false },
    { "<leader>,", false },
    { "<leader>,", false },
    { "<leader>fw", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
}
