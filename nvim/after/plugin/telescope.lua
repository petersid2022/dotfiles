require('telescope').setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown()
		}
	},
	defaults = {
		mappings = {
			i = {
				["<esc>"] = require('telescope.actions').close,
				["<Space>t"] = require('telescope.actions').close,
				["<Tab>"] = require('telescope.actions').move_selection_previous,
				["<S-Tab>"] = require('telescope.actions').move_selection_next,
			},
		}
	}
}

-- pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope: Find Files" })
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = "Telescope: LSP Symbols" })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Telescope: Workspace Live Grep" })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Telescope: Search Git Files" })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Telescope: Git Status" })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Telescope: Git Commits" })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "Telescope: LSP References" })
vim.keymap.set('n', '<leader>dw', builtin.diagnostics, { desc = "Telescope: Workspace Diagnostics" })
vim.keymap.set('n', '<leader>db', function() builtin.diagnostics { bufnr = 0 } end,
	{ desc = "Telescope: Buffer Diagnostics" })
vim.keymap.set('n', '<leader>sp', builtin.spell_suggest, { desc = "Telescope: Spell Suggest" })
vim.keymap.set('n', '<leader>t', function() builtin.keymaps { show_plug = false, modes = { "n" } } end,
	{ desc = "Telescope: Search Keymaps" })
vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = "Telescope: Buffer Find Word" })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope: Search Current Word across Workspace' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = "Telescope: Help Tags" })
