-- lua/config/lazy.lua
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.typescript" }, -- This line is crucial
    { import = "plugins" },
  },
})
