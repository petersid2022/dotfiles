require "petrside.autocmds"
require "petrside.options"
require "petrside.remap"

vim.loader.enable()
vim.cmd.colorscheme("retrobox")
vim.lsp.enable({ "lua_ls", "ruff", "clangd" })
vim.diagnostic.config({ severity_sort = true, virtual_text = true, virtual_lines = true })
