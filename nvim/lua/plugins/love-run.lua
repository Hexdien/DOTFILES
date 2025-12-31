--# selene: allow(mixed_table)

return {
	{
		-- Usando LazyVim como base para adicionar keymap
		"LazyVim/LazyVim",
		keys = function(_, keys)
			table.insert(keys, {
				"<leader>dl",
				function()
					-- Salva todos os buffers antes de rodar
					vim.cmd("wall")
					-- Executa LÖVE no diretório atual
					vim.cmd("!love .")
				end,
				desc = "Run LÖVE (love .)",
			})
			return keys
		end,
	},
}
