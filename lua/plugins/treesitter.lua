return {
  {
    "heitor-lassarote/alex-happy-vim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    opts = {
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "pug",
        "python",
        "rust",
        "typescript",
        "vim",
        "vue",
        "yaml",
        "go",
        "java",
        "zig",
      },
    }
  },
}
