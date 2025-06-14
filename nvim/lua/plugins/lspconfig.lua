return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			--set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show LSP definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telsecope lsp_implementations<CR>", opts) -- show LSP implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telsecope lsp_type_definitions<CR>", opts) -- show LSP implementations

			opts.desc = "See available code actions"
			keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts) -- show LSP implementations

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- show LSP implementations

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telsecope diagnostics bufnr=0<CR>", opts) -- show LSP implementations

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show LSP implementations

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- show LSP implementations

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- show LSP implementations

			opts.desc = "Show documenmarriedtation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show LSP implementations

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- show LSP implementations
		end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- change the diagnostic symbols in the sign column (gutter)
        local signs = { Error = "x", Warn = "!", Hint = "o", Info = "i" }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
        
        -- configure lua server
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = { -- custom settings for Lua
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        })

        -- configure java server
        lspconfig["jdtls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure QML server
        require("lspconfig").qmlls.setup {
          cmd = {"qmlls", "-E"}
        }
	end,
}
