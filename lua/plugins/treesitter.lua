return {
  {
    "heitor-lassarote/alex-happy-vim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "css",
          "go",
          "haskell",
          "javascript",
          "latex",
          "lua",
          "markdown",
          "pug",
          "python",
          "rust",
          "scss",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "vue",
          "yaml",
          "zig",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
