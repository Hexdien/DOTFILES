return {
  {
    "nvim-java/nvim-java",
    opts = function(_, opts)
      local lombok_path = vim.fn.expand("~/.local/share/lombok/lombok.jar")

      opts.jdtls = opts.jdtls or {}
      opts.jdtls.cmd = opts.jdtls.cmd or {}

      -- injeta o javaagent do Lombok
      table.insert(opts.jdtls.cmd, 2, "--jvm-arg=-javaagent:" .. lombok_path)
    end,
  },
}
