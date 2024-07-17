function CustomTab()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    s = s .. '%' .. i .. 'T'
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local filename = vim.fn.bufname(bufnr)
    filename = vim.fn.fnamemodify(filename, ':t')
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end
    s = s .. ' ' .. filename .. ' '
  end
  s = s .. '%#TabLineFill#%T'
  return s
end

vim.o.tabline = '%!v:lua.CustomTab()'

-- vim.keymap.set("", "<leader><tab>", function()
--   local pickers = require('telescope.pickers')
--   local finders = require('telescope.finders')
--   local sorters = require('telescope.sorters')
--   local actions = require('telescope.actions')
--   local themes = require('telescope.themes')
--   local action_state = require('telescope.actions.state')
--
--   local tabs = vim.api.nvim_list_tabpages()
--   local tab_entries = {}
--
--   for _, tab in ipairs(tabs) do
--     local tab_nr = vim.api.nvim_tabpage_get_number(tab)
--     local tab_name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab)))
--     table.insert(tab_entries, { tab_nr = tab_nr, tab_name = tab_name ~= "" and tab_name or "[No Name]" })
--   end
--
--   pickers.new(themes.get_dropdown {}, {
--     prompt_title = 'Navigate Tabs',
--     initial_mode = 'normal',
--     finder = finders.new_table {
--       results = tab_entries,
--       entry_maker = function(entry)
--         return {
--           value = entry,
--           display = string.format("Tab %d: %s", entry.tab_nr, entry.tab_name),
--           ordinal = entry.tab_nr
--         }
--       end
--     },
--     sorter = sorters.get_generic_fuzzy_sorter(),
--     attach_mappings = function(prompt_bufnr, _)
--       actions.select_default:replace(function()
--         local selection = action_state.get_selected_entry()
--         actions.close(prompt_bufnr)
--         vim.api.nvim_set_current_tabpage(tabs[selection.value.tab_nr])
--       end)
--       return true
--     end
--   }):find()
-- end, { desc = "Neovim: Tabs", silent = true })
