return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  branch = "0.1.x",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local builtin = require "telescope.builtin"
    local themes = require "telescope.themes"

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<Tab>"] = actions.toggle_selection,
            ["<S-Tab>"] = actions.toggle_selection,
            ["<space>t"] = actions.close,
            ["q"] = actions.close,
          },
          n = {
            ["<Tab>"] = actions.toggle_selection,
            ["<S-Tab>"] = actions.toggle_selection,
            ["q"] = actions.close,
          },
        },
      },
      extensions = {
        fzf = {},
      },
    }

    pcall(telescope.load_extension, "fzf")

    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = "Telescope: " .. desc })
    end

    -- Searching
    map("n", "<leader>t", builtin.find_files, "Find Files")
    map("n", "<leader>fs", builtin.live_grep, "Live Grep across Workspace")
    map("n", "<leader>ff", builtin.current_buffer_fuzzy_find, "Fuzzy Find across current buffer")
    map("n", "<leader>sw", builtin.grep_string, "Search Current word across Workspace")

    -- Git
    map("n", "<leader>gf", function()
      builtin.git_files { previewer = false }
    end, "Search Git Files")
    map("n", "<leader>gs", builtin.git_status, "View Git Status")

    -- LSP and diagnostics
    map("n", "gr", function()
      builtin.lsp_references { initial_mode = 'normal' }
    end, "Goto References")
    map("n", "<leader>ls", builtin.lsp_document_symbols, "Document Symbols")
    map("n", "<leader>d", function()
      builtin.diagnostics(themes.get_ivy { bufnr = 0, initial_mode = 'normal' })
    end, "Buffer diagnostics")
    map("n", "<leader>wd", function()
      builtin.diagnostics(themes.get_ivy { bufnr = nil, initial_mode = 'normal' })
    end, "Workspace diagnostics")

    -- Misc
    map("n", "<space>nv", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, "Edit nvim config")
    map("n", "<leader>b", function()
      builtin.buffers { sort_lastused = true, initial_mode = 'normal' }
    end, "Search open buffers")
    map("n", "<leader>sp", function()
      builtin.spell_suggest { initial_mode = 'normal' }
    end, "Spell Suggest")
    map("n", "<leader>k", function()
      builtin.keymaps { show_plug = false, modes = { "n" } }
    end, "Search Keymaps")
    map("n", "<leader>ht", builtin.help_tags, "Help Tags")
    map("n", "<leader>hq", builtin.quickfixhistory, "Open Quickfix history")
    map("n", "<leader>co", function()
      builtin.colorscheme { enable_preview = true, initial_mode = 'normal' }
    end, "Colorscheme")
  end,
}
