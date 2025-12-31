-- lua/plugins/lsp.lua (or a similar file)
return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"typescript-language-server", -- Ensures tsserver is installed
				-- Add other language servers as needed
			})
		end,
	},
	-- Other LSP-related configurations
}
