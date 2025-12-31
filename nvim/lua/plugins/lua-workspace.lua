-- lua/plugins/lua-workspace.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT", -- LÖVE usa LuaJIT
              },
              diagnostics = {
                globals = { "vim", "love" }, -- evita falso-positivo ao usar a API do LÖVE
              },
              workspace = {
                checkThirdParty = false,
                -- Pode apontar libs de typings, se usar:
                -- library = { vim.fn.expand("$VIMRUNTIME/lua") },
              },
              telemetry = { enable = false },
            },
          },
        },
      },
    },
  },
}
