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

  local scan_dir = function(directory, additional_files)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('find "' .. directory .. '" -type f')
    for filename in pfile:lines() do
      i = i + 1
      t[i] = filename
    end
    pfile:close()

    if additional_files then
      for _, file in ipairs(additional_files) do
        i = i + 1
        t[i] = file
      end
    end

    table.sort(t)
    return t
  end

  -- local files = scan_dir(vim.fn.expand "~/ece/vaults/work/Daily",
  --   { vim.fn.expand("~/Documents/toread.md"), vim.fn.expand("/home/petrside/ece/septembrios2024/TODO.md"), vim.fn.expand(
  --     "/home/petrside/ece/septembrios2024") })
  local files = scan_dir(vim.fn.expand "~/ece/vaults/work/Daily",
    { vim.fn.expand("~/Documents/toread.md"), vim.fn.expand("/home/petrside/ece/septembrios2024/TODO.md") })

  pickers
      .new(themes.get_dropdown {}, {
        prompt_title = "Notes",
        initial_mode = 'normal',
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

          map("n", "<c-t>", function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            vim.cmd("tabedit " .. selection[1])
          end)

          map("n", "<c-v>", function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            vim.cmd("vnew " .. selection[1])
          end)

          map("n", "<c-n>", function()
            actions.close(prompt_bufnr)
            local date_str = os.date "%Y-%m-%d"
            local new_file_path = vim.fn.expand("~/ece/vaults/work/Daily/" .. date_str .. ".md")
            vim.cmd(string.format("edit %s", new_file_path))
          end)

          map("n", "<c-x>", function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if vim.inspect(selection[1]) ~= "\"/home/petrside/Documents/toread.md\"" then
              -- print(vim.inspect(selection[1]))
              vim.cmd(string.format("!rm %s", selection[1]))
            else
              vim.notify("Cannot delete this file!", vim.log.levels.ERROR)
            end
          end)

          return true
        end,
      })
      :find()
end, "Neovim: Notes", true)
