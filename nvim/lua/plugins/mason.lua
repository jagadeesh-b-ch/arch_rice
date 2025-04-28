return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function ()
    local mason = require("mason")
    local masonLspConfig = require("mason-lspconfig")
    mason.setup({
      ui = {
        icons = {
          package_installed = "+",
          package_pending = "|",
          package_uninstalled = "-"
        }
      }
    })
    masonLspConfig.setup({
      ensure_installed = {
        "lua_ls",
        "jdtls"
      },
      automatic_installation = true,
    })
  end
}
