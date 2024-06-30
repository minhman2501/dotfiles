return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- enable mason and configure icons
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
          keymaps = {
            toggle_package_expand = "o",
            uninstall_package = "d",
          },
        },
      })

      require("mason-lspconfig").setup({
        -- list of servers for mason to install
        ensure_installed = {
          "tsserver",
          "html",
          "tailwindcss",
          "svelte",
          "lua_ls",
          "emmet_ls",
          "prismals",
          "pyright",
        },

        --auto-install configured servers
        automatic_installation = true,
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "prettierd", -- prettier formatter
          "stylua", -- lua formatter
          "isort", -- python formatter
          "black", -- python formatter
          "pylint",
          "eslint_d",
        },
      })
    end,
  },
}
