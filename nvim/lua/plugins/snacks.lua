return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          cwd = vim.fn.getcwd(),
          win = {
            list = {
              keys = {
                ["<BS>"] = "", -- Disables Backspace (Go up)
                ["h"] = "explorer_close_dir", -- Changes 'h' to only close folders, not go up
              },
            },
          },
        },
      },
    },
  },
}
