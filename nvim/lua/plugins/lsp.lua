return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          -- this forces LazyVim to use the symlink for qmlls in /usr/bin/qmlls
          cmd = { "/usr/lib/qt6/bin/qmlls" },
          settings = {
            -- Optional: ensuring the imports are recognized
            qml = {
              importPaths = { "/usr/lib/qt6/modules" },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "hl" },
              },
              workspace = {
                library = {
                  "/usr/share/hypr/stubs",
                },
              },
            },
          },
        },
        pyright = {},
      },
    },
  },
}
