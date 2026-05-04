return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  adapters = {
    http = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          env = {
            api_key = "",
          },
        })
      end,
      kilocode = function()
        return require("codecompanion.adapters").extend("kilocode", {
          env = {
            api_key = "",
          },
        })
      end,
    },
  },
}
