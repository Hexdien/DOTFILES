-- Força o nvim-lint a usar o .selene.toml da raiz do projeto
return {
	"mfussenegger/nvim-lint",
	opts = function(_, opts)
		local lint = require("lint")
		-- Garante tabela
		opts.linters_by_ft = opts.linters_by_ft or {}
		-- Ativa Selene para Lua (se já tiver, pode manter)
		opts.linters_by_ft.lua = { "selene" }

		-- Resolve o caminho do config .selene.toml / selene.toml
		lint.linters.selene = lint.linters.selene or { cmd = "selene" }
		lint.linters.selene.args = function(ctx)
			local util = require("lspconfig.util")
			local root = util.root_pattern(".selene.toml", "selene.toml", ".git")(ctx.filename) or vim.loop.cwd()
			local cfg = root .. "/.selene.toml"
			if vim.fn.filereadable(cfg) == 1 then
				return { "--config", cfg, "-" }
			end
			cfg = root .. "/selene.toml"
			if vim.fn.filereadable(cfg) == 1 then
				return { "--config", cfg, "-" }
			end
			-- fallback: stdin sem config (não ideal, mas evita crash)
			return { "-" }
		end
	end,
}
