return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "stylua", "eslint_d" },
      })

      vim.cmd(":MasonUpdate")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "biome",
          "copilot",
          "eslint",
          "lua_ls",
          "marksman",
          "pyright",
          "ts_ls",
          "vimls",
          "vue_ls",
          "zls"
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = function(_, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end

      -- List of servers with default settings
      local servers = {
        "biome",
        "lua_ls",
        "copilot",
        "marksman",
        "vimls",
        "rust_analyzer",
        "hls",
        "pyright",
        "zls",
        "vue_ls",
      }

      -- Set up each server with the default on_attach
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { on_attach = on_attach })
        vim.lsp.enable({ server })
      end

      vim.lsp.config("ts_ls", {
        on_attach = function(_, bufnr)
          on_attach(_, bufnr)

          vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            "<leader>co",
            "<cmd>lua vim.lsp.buf.execute_command({ command = '_typescript.organizeImports', arguments = { vim.fn.expand('%:p') }})<cr>",
            { noremap = true, silent = true, desc = "Organize imports" }
          )
        end,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      modes = {
        symbols = { focus = true, win = { position = "left" } },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "eslint_d", stop_after_first = true },
        typescript = { "eslint_d", stop_after_first = true },
        javascriptreact = { "eslint_d", stop_after_first = true },
        typescriptreact = { "eslint_d", stop_after_first = true },
        vue = { "eslint_d", stop_after_first = true },
        rust = { "rustfmt" },
      },
      format_on_save = {
        lsp_format = "fallback",
      },
    },
  },
}
