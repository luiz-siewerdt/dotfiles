return {
	-- { "artur-shaik/jc.nvim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "CRAG666/code_runner.nvim", config = true },
  -- { "styled-components/vim-styled-components" },
	{ "mg979/vim-visual-multi" },
	-- { "hoffs/omnisharp-extended-lsp.nvim" },
}
