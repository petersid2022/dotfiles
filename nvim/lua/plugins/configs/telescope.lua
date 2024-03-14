local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope: Find Files" })
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = "Telescope: LSP Symbols" })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Telescope: Live Grep inside Workspace" })
vim.keymap.set('n', '<leader>s/', function() builtin.live_grep { grep_open_files = true, } end,
	{ desc = 'Telescope: Live Grep inside Open Files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Telescope: Search Git Files" })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "Telescope: LSP References" })
vim.keymap.set('n', '<leader>dw', builtin.diagnostics, { desc = "Telescope: Workspace Diagnostics" })
vim.keymap.set('n', '<leader>db', function() builtin.diagnostics { bufnr = 0 } end,
	{ desc = "Telescope: Buffer Diagnostics" })
vim.keymap.set('n', '<leader>sp', builtin.spell_suggest, { desc = "Telescope: Spell Suggest" })
vim.keymap.set('n', '<leader>t', function() builtin.keymaps { show_plug = false, modes = { "n" } } end,
	{ desc = "Telescope: Search Keymaps" })
vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = "Telescope: Fuzzy-Find word in current buffer" })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope: Search Current Word across Workspace' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = "Telescope: Help Tags" })
vim.keymap.set('n', '<leader>co', function() builtin.colorscheme { enable_preview = true } end,
	{ desc = "Telescope: Preview Colorscheme" })
vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = "Telescope: Lists open buffers in current neovim instance" })
