local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "VeryLazy",

	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			ghost_text = { enabled = true },
		},

		sources = { default = { "lsp", "path" } },

		appearance = { kind_icons = cmp_kinds },
	},

	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
}
