return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "clangd" },
		})

		require("mason-tool-installer").setup({
			ensure_installed = { "stylua", "black", "isort" },
		})
	end,
}
