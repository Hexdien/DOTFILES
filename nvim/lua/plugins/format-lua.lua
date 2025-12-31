--# selene: allow(mixed_table)

return {
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			opts.formatters_by_ft.lua = { "stylua" }
			-- opcional: formatar ao salvar
			opts.format_on_save = function(bufnr)
				if vim.bo[bufnr].filetype == "lua" then
					return { timeout_ms = 1000, lsp_fallback = true }
				end
			end
			-- cria o comando :Format se você quiser usá-lo
			vim.api.nvim_create_user_command("Format", function()
				require("conform").format()
			end, {})
			return opts
		end,
	},
}
