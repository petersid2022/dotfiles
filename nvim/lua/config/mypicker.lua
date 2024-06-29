local map = function(mode, keys, func, desc, silent)
  vim.keymap.set(mode, keys, func, { desc = desc, silent = silent })
end

map("", "<leader><leader>", function()
  local pickers = require "telescope.pickers"
  local themes = require "telescope.themes"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  local scan_dir = function(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('find "' .. directory .. '" -type f')
    for filename in pfile:lines() do
      i = i + 1
      t[i] = filename
    end
    pfile:close()
    table.sort(t)
    return t
  end

  local files = scan_dir(vim.fn.expand "~/ece/vaults/work/Daily")

  pickers
      .new(themes.get_ivy {}, {
        prompt_title = "Notes",
        finder = finders.new_table {
          results = files,
        },
        sorter = conf.generic_sorter(),
        previewer = conf.file_previewer(conf),
        layout_config = {
          prompt_position = "top",
          width = 0.8,
          height = 0.6,
          preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd(string.format("edit %s", selection[1]))
          end)

          map("i", "<c-t>", function()
            local date_str = os.date "%Y-%m-%d"
            local new_file_path = vim.fn.expand("~/vaults/work/Daily/" .. date_str .. ".md")
            actions.close(prompt_bufnr)
            vim.cmd(string.format("edit %s", new_file_path))
          end)

          map("i", "<c-x>", function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd(string.format("!rm %s", selection[1]))
          end)

          return true
        end,
      })
      :find()
end, nil, true)
