return {
  -- 1. Disable Neo-tree (LazyVim default explorer)
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- 2. Configure and Enable nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Load on VeryLazy or when explicitly opened so it doesn't slow down startup
    lazy = false,
    keys = {
      -- Map toggle to <leader>e (standard LazyVim explorer shortcut)
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Nvim-Tree (Root Dir)" },
      -- Map <leader>E to find current file (mimics IntelliJ's Select in Project View)
      { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Nvim-Tree Find File" },
    },
    opts = {
      -- Prevent netrw from loading
      hijack_netrw = true,

      -- Auto-expand and focus on file changes
      update_focused_file = {
        enable = true,
        update_root = true,
      },

      renderer = {
        -- CRITICAL: Combines nested empty directory chains (e.g., com/example/app) into
        -- a single line item, making it expand entirely on one click.
        group_empty = true,

        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },

      view = {
        width = 35,
        side = "left",
      },

      -- Additional settings for a clean IDE-like setup
      diagnostics = {
        enable = true, -- Displays LSP errors next to broken files
        show_on_dirs = true,
      },
      filters = {
        dotfiles = false, -- Change to true if you want to hide hidden files
      },
    },
    config = function(_, opts)
      -- Required step to properly initialize netrw disabling at the start
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup(opts)
    end,
  },
}
