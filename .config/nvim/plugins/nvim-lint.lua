return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufWritePost",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      css = { "eslint_d" },
      html = { "eslint_d" },
      json = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", {
      clear = true,
    })

    local venv_path =
      'import sys; sys.path.append("/usr/lib/python3.11/site-packages"); import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)'

    local pylint = lint.linters.pylint
    pylint.args = {
      "-f",
      "json",
      "--init-hook",
      venv_path,
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeavePre" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>t", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current buffer" })
  end,
}
