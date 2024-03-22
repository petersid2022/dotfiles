require("mason").setup({
    log_level = vim.log.levels.OFF,
    ui = {
        border = "single",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
