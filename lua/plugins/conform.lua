return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = require("config.conform"),
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "biome" },
    },
  },
}
