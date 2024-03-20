local trouble = require("trouble.providers.telescope")

local open_selected_with_trouble = function(...)
    return trouble.open_selected_with_trouble(...)
end

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<c-q>"] = trouble.open_with_trouble,
                ["<c-s-q>"] = open_selected_with_trouble
            },
            n = {
                ["<c-q>"] = trouble.open_with_trouble,
                ["<c-s-q>"] = open_selected_with_trouble
            },
        },
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
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


-- LSP
map('n', '<leader>ls', function() builtin.lsp_document_symbols { previewer = false, show_line = true } end, "LSP Symbols")
map('n', '<leader>lr', builtin.lsp_references, "LSP References")
-- map('n', '<leader>dw', builtin.diagnostics, "Workspace Diagnostics")
-- map('n', '<leader>db', function() builtin.diagnostics { bufnr = 0 } end, "Buffer Diagnostics")

-- Searching
map('n', '<leader>t', function() builtin.find_files { previewer = false } end, "Find Files")
map('n', '<leader>fs', builtin.live_grep, "Live Grep inside Workspace")
map('n', '<leader>fw', builtin.current_buffer_fuzzy_find, "Fuzzy-Find word in current buffer")
map('n', '<leader>sw', builtin.grep_string, "Search Current Word across Workspace")

-- Git
map('n', '<leader>gf', function() builtin.git_files { previewer = false } end, "Search Git Files")
map('n', '<leader>gc', builtin.git_commits, "Search Git Commits")

-- Misc
map('n', '<leader>sp', builtin.spell_suggest, "Spell Suggest")
map('n', '<leader>k', function() builtin.keymaps { show_plug = false, modes = { "n" } } end, "Search Keymaps")
map('n', '<leader>ht', function() builtin.help_tags { previewer = false } end, "Help Tags")
map('n', '<leader>bb', function() builtin.buffers { previewer = false } end, "Lists open buffers")
