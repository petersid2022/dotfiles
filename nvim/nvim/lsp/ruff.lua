---@type vim.lsp.Config
return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "requirements.txt", "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  settings = {},
}
