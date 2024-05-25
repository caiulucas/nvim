return {
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({
        query = {
          tsx = "rainbow-parens",
        },
        highlight = {
          "DiagnosticWarn",
          "DiagnosticError",
          "DiagnosticInfo",
          "DiagnosticHint",
          "DiagnosticOk",
        },
      })
    end,
  },
}
