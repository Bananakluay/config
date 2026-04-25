return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"vim",
				"vimdoc",

				"c",
				"cpp",
				"go",
				"python",
				"lua",

				"html",
				"css",
				"javascript",
				"typescript",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
		})
	end,
}
