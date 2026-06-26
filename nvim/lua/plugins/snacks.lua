return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          cwd = vim.fn.getcwd(),
          actions = {
            -- Custom action to recursively expand deep, single-nested folders
            -- recursive_toggle = function(picker, item)
            --   if not item or not item.dir then
            --     return require("snacks.picker.actions").confirm(picker, item)
            --   end
            --
            --   -- Standard folder toggle
            --   require("snacks.explorer.actions").toggle(picker, item)
            --
            --   -- Recursively drill through single-child nodes safely
            --   local node = item
            --   while node and node.dir and node.children and #node.children == 1 do
            --     node = node.children[1]
            --     if node and node.dir then
            --       node.open = true
            --     end
            --   end
            --   picker:render()
            -- end,
            -- recursive_toggle = function(picker, item)
            --   local Actions = require("snacks.explorer.actions")
            --   local function expand_empty_nodes(node)
            --     if node and node.dir and #node.children == 1 then
            --       node.open = true
            --       expand_empty_nodes(node.children[1])
            --     end
            --   end
            --   Actions.toggle(picker, item) -- Open the initial folder
            --   if item and item.dir then
            --     expand_empty_nodes(item)
            --     picker:render()
            --   end
            -- end,
          },
          win = {
            list = {
              keys = {
                -- Remap Enter or 'l' to use our recursive logic instead of standard toggle
                -- ["<CR>"] = "recursive_toggle",
                -- ["l"] = "recursive_toggle",
              },
            },
          },
        },
      },
    },
  },
}
