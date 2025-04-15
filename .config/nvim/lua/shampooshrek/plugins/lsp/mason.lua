return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", config = function() end },
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "uga",
					package_pending = "uba",
					package_uninstalled = "uta",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"html",
				"pylsp",
				"bashls",
				"css_variables",
				"cssls",
				"tailwindcss",
				-- "eslint",
				"ts_ls",
				"clangd",
				"jsonls",
			},
			automatic_installation = true,
		})
	end,
}
