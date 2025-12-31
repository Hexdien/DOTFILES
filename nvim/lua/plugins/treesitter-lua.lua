--# selene: allow(mixed_table)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "luadoc", "markdown", "markdown_inline" },
    },
  },
}
