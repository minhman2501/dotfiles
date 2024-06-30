return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore",
        },
        [".prettierrc"] = {
          icon = "󰰘",
          color = "#F11A7B",
          name = "Prettier",
        },
        [".prettierignore"] = {
          icon = "󰰘",
          name = "Prettierignore",
        },
      },
    })
  end,
}
