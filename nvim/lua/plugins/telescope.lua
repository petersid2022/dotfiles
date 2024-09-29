return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  branch = "0.1.x",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local telescope = require "telescope"
    local builtin = require "telescope.builtin"

    telescope.setup {}

    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fs", builtin.live_grep)
    vim.keymap.set("n", "<leader>sw", builtin.grep_string)
    vim.keymap.set("n", "<leader>gf", builtin.git_files)
    vim.keymap.set("n", "<leader>gs", builtin.git_status)
    vim.keymap.set("n", "<leader>sp", builtin.spell_suggest)
    vim.keymap.set("n", "<leader>ht", builtin.help_tags)
    vim.keymap.set("n", "<leader>b", builtin.buffers)
    vim.keymap.set("n", "<leader>hm", function()
      builtin.man_pages { sections = { "ALL" } }
    end)
  end
}
