return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = {
    "TSInstall",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
    "TSInstallInfo",
    "TSInstallSync",
  },
  keys = {
    { "<leader>Tu", "<cmd>TSUpdateSync<CR>", desc = "Treesitter Update sync" },
  },
  event = { "BufRead", "VeryLazy" },
  opts = {
    indent = true,
    ensure_installed = {
      "bash",
      "comment",
      "html",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "regex",
      "rust",
      "scss",
      "query",
      "svelte",
      "toml",
      "tsx",
      "python",
      "javascript",
      "typescript",
      "yaml",
      "c_sharp",
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
    },
    playground = {
      enable = true,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
