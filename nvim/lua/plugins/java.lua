-- ~/.config/nvim/lua/plugins/java.lua
return {
	-- Plugin principal (nvim-java)
	{
		"nvim-java/nvim-java",
		ft = { "java" },
		opts = {
			dap = {
				enabled = false,
			},
		},
	},
	-- Evitar conflito: não deixar LazyVim subir jdtls "por conta própria"
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = { jdtls = nil }, -- não peça p/ mason instalar/gerir jdtls
			setup = {
				jdtls = function()
					return true
				end,
			}, -- e não faça setup duplicado
		},
	},

	-- Se o nvim-jdtls estiver presente por algum motivo, desabilite:
	{ "mfussenegger/nvim-jdtls", enabled = false },
}
