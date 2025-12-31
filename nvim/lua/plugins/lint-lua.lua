-- lua/plugins/lint-lua.lua
return {
	{
		"mfussenegger/nvim-lint",
		opts = function(_, opts)
			opts.linters_by_ft = opts.linters_by_ft or {}
			opts.linters_by_ft.lua = { "selene" }
			-- Opcional: rodar lint ao salvar/entrar no buffer
			local lint = require("lint")
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
				callback = function()
					if vim.bo.filetype == "lua" then
						lint.try_lint()
					end
				end,
			})
			return opts
		end,
	},
}
