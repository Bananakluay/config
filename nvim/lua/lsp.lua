local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP Actions",
	callback = function(args)
		local buf = args.buf

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
		end

		-- Formatinhhg
		map("<leader>fm", function()
			vim.lsp.buf.format()
		end, "Format Buffer")

		-- Navigation
		map("gd", vim.lsp.buf.definition, "Go to Definition")
		map("gD", vim.lsp.buf.declaration, "Go to Declaration")
		map("gi", vim.lsp.buf.implementation, "Go to Implementation")
		map("gr", vim.lsp.buf.references, "Go to References")

		-- Information
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>k", vim.lsp.buf.signature_help, "Signature Help")

		-- Diagnostic
		map("[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
		map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
		map("<leader>d", vim.diagnostic.open_float, "Show Error")

		-- Actions
		map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

		-- Inlay hints toggle
		if vim.lsp.inlay_hint then
			map("<leader>th", function()
				local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
				vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
			end, "Toggle Inlay Hints")
		end
	end,
})
