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
          "vtsls",
          "vimls",
          "vue_ls",
          "zls",
          "gopls"
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
        "marksman",
        "vimls",
        "rust_analyzer",
        "hls",
        "pyright",
        "zls",
        "vue_ls",
        "gopls",
      }

      local vue_language_server_path = vim.fn.stdpath("data") ..
      "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      }

      vim.lsp.config("vtsls", {
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            }
          },
          vtsls = {
            tsserver = {
              globalPlugins = { vue_plugin },
            },
          }
        }
      })
      vim.lsp.enable({ "vtsls" })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            ["ui.inlayhint.hints"] = {
              compositeLiteralFields = true,
              constantValues = true,
              parameterNames = true
            },
          },
        },
      })

      -- Set up each server with the default on_attach
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { on_attach = on_attach })
        vim.lsp.enable({ server })
      end
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
