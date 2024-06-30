local icons = require("icons")

return {
  {
    "nvim-tree/nvim-tree.lua",
    event = "BufEnter",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Open Explorer" },
      { "<leader>E", "<cmd>NvimTreeFocus<cr>", desc = "Focus On Explorer" },
    },
    opts = {
      reload_on_bufenter = true,
      hijack_cursor = true,
      hijack_netrw = true,
      sync_root_with_cwd = true,
      hijack_unnamed_buffer_when_opening = true,
      auto_reload_on_write = true,
      diagnostics = {
        enable = false,
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          resize_window = true,
        },
      },
      update_focused_file = {
        enable = true,
      },
      view = {
        centralize_selection = true,
        adaptive_size = false,
        side = "right",
        preserve_window_proportions = true,
        float = {
          enable = true,
          quit_on_focus_loss = false,
          open_win_config = function()
            return {
              row = 0,
              width = 30,
              border = "rounded",
              relative = "editor",
              col = vim.o.columns,
              height = vim.o.lines,
            }
          end,
        },
      },
      renderer = {
        full_name = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            git = {
              unmerged = icons.FileUnmerged,
              renamed = icons.FileRenamed,
              deleted = icons.FileDeleted,
              ignored = icons.FileIgnored,
              unstaged = icons.FileUnstaged,
              staged = icons.FileStaged,
              untracked = icons.FileUntracked,
            },
          },
        },
      },
    },
    config = function(_, opts)
      local nvimtree = require("nvim-tree")

      nvimtree.setup(opts)

      local function open_tree_on_setup(args)
        vim.schedule(function()
          local file = args.file
          local buf_name = vim.api.nvim_buf_get_name(0)
          local is_no_name_buffer = buf_name == "" and vim.bo.filetype == "" and vim.bo.buftype == ""
          local is_directory = vim.fn.isdirectory(file) == 1

          if not is_no_name_buffer and not is_directory then
            return
          end

          if is_directory then
            vim.cmd.cd(file)
          end

          require("nvim-tree.api").tree.open()
        end)
      end

      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("nvim-tree", { clear = true }),
        callback = open_tree_on_setup,
      })
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = true,
  },
}
