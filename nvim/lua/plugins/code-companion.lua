return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          env = {
            api_key = "",
          },
        })
      end,
      opencode = function()
        return require("codecompanion.adapters").extend("opencode", {
          env = {
            api_key = "cmd:pass show ai/opencode --no-newline",
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
    strategies = {
      chat = {
        adapter = {
          name = "opencode",
        },
      },
      cli = {
        agent = "opencode",
        agents = {
          opencode = {
            cmd = "opencode",
            args = {},
            description = "Opecode CLI",
            provider = "terminal",
          },
        },
      },
    },
  },
  keys = {
    { "<Leader>a", "", desc = "ai" },
    { "<Leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat", mode = { "n", "v" } },
    { "<Leader>aa", "<cmd>CodeCompanionCLI Ask<cr>", desc = "Open CodeCompanion CLI", mode = "n" },
  },
}
