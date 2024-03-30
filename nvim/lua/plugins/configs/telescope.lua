return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "ignore_case",
        }
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require('telescope.builtin')

    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = "Telescope: " .. desc })
    end

    -- Searching
    map('n', '<leader>t', function() builtin.find_files { previewer = false } end, "Find Files")
    map('n', '<leader>fs', builtin.live_grep, "Live Grep across Workspace")
    map('n', '<leader>sw', builtin.grep_string, "Search Current Word across Workspace")

    -- Git
    map('n', '<leader>gf', function() builtin.git_files { previewer = false } end, "Search Git Files")

    -- Misc
    map('n', '<leader>sp', builtin.spell_suggest, "Spell Suggest")
    map('n', '<leader>k', function() builtin.keymaps { show_plug = false, modes = { "n" } } end, "Search Keymaps")
    map('n', '<leader>h', function() builtin.help_tags { previewer = false } end, "Help Tags")
  end,
}
