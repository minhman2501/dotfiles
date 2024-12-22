return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = {},
        typescript = {},
        javascriptreact = {},
        typescriptreact = {},
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 500,
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format File Or Range (In Visual Mode)" })
  end,
}
