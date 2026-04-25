return {
	"nvim-lualine/lualine.nvim",
 	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			globalstatus = true,
			theme = "auto",
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{
					"filename",
					path = 1,
					-- Hide NvimTree buffer
					cond = function()
						local buf_ft = vim.bo[vim.api.nvim_get_current_buf()].filetype
						return buf_ft ~= "NvimTree"
					end,
				},
			},
			lualine_x = {
				{
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })

						if vim.tbl_isempty(clients) then
							return "-"
						end
						local names = {}
						for _, client in ipairs(clients) do
							table.insert(names, client.name)
						end
						return table.concat(names, ", ")
					end,
					icon = "LSP:",
				},
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
