return {
  'ThePrimeagen/harpoon',
  event = 'BufEnter',
  commit = 'ccae1b9bec717ae284906b0bf83d720e59d12b91',
  pin = true,
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    local map = function(mode, keys, func, desc, silent)
      vim.keymap.set(mode, keys, func, { desc = "Harpoon: " .. desc, silent = silent })
    end

    map('n', '<A-d>', ui.toggle_quick_menu, "Toggle quick menu", true)
    map('n', '<A-s>', ui.nav_next, "Navigate to next bookmark", true)
    map('n', '<A-a>', mark.add_file, "Add file to bookmarks", true)
    map("n", "<A-q>", function() ui.nav_file(1) end, "Go to bookmark 1", true)
    map("n", "<A-w>", function() ui.nav_file(2) end, "Go to bookmark 2", true)
    map("n", "<A-e>", function() ui.nav_file(3) end, "Go to bookmark 3", true)
    map("n", "<A-r>", function() ui.nav_file(4) end, "Go to bookmark 4", true)
    map("n", "<A-t>", function() ui.nav_file(5) end, "Go to bookmark 5", true)
  end
}
