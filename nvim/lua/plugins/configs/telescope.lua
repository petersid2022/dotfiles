return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  branch = "0.1.x",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local builtin = require "telescope.builtin"

    telescope.setup {
      defaults = {
        layout_strategy = 'flex',
        layout_config = { width = 0.95 },
        mappings = {
          i = {
            ["<Tab>"] = actions.toggle_selection,
            ["<S-Tab>"] = actions.toggle_selection,
          },
          n = {
            ["<Tab>"] = actions.toggle_selection,
            ["<S-Tab>"] = actions.toggle_selection,
          }
        }
      }
    }

    vim.keymap.set("n", "<leader>ff", builtin.find_files, nil)
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, nil)
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, nil)
    vim.keymap.set("n", "<leader>gf", builtin.git_files, nil)
    vim.keymap.set("n", "<leader>gs", builtin.git_status, nil)
    vim.keymap.set("n", "<leader>sp", builtin.spell_suggest, nil)
    vim.keymap.set("n", "<leader>ht", builtin.help_tags, nil)

    vim.keymap.set("n", "<leader>hm", function()
      builtin.man_pages { sections = { "ALL" } }
    end, nil)

    vim.keymap.set("n", "<leader>co", function()
      builtin.colorscheme { enable_preview = true, initial_mode = 'normal' }
    end, nil)
  end
}
