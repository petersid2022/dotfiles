require("trouble").setup {}
vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>w", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>q", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>l", function() require("trouble").toggle("lsp_references") end)
--vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
--vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
