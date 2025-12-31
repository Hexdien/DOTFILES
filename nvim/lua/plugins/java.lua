return {
	{
		"nvim-java/nvim-java",
		ft = { "java" },
		opts = {
			dap = {
				enabled = false,
			},
		},
	},

	-- Impedir que o LazyVim/lspconfig tente subir jdtls por fora
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jdtls = nil,
			},
			setup = {
				jdtls = function()
					return true
				end,
			},
		},
	},

	-- NÃO declarar nvim-jdtls em lugar nenhum
}
