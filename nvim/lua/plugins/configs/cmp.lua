return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local cmp = require "cmp"
    cmp.setup {
      view = {
        entries = {
          follow_cursor = true,
        },
      },
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-y>"] = cmp.mapping.confirm { select = true },
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }
      })
    }
  end
}
