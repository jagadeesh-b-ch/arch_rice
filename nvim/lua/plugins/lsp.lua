return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          -- this forces LazyVim to use the symlink for qmlls in /usr/bin/qmlls
          cmd = { "/lib/qt6/bin/qmlls" },
          settings = {
            -- Optional: ensuring the imports are recognized
            qml = {
              importPaths = { "/usr/lib/qt6/modules" },
            },
          },
        },
      },
    },
  },
}
