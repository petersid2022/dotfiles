local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ah", mark.add_file, { desc = "add to harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "harpoon menu" })
vim.keymap.set("n", "<C-s>", function() ui.nav_next() end, { desc = "harpoon-next" })
