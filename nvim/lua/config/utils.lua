local M = {}

function M.toggle_language()
    local mode = vim.api.nvim_get_mode()
    if mode.mode ~= "n" then
        local key = vim.api.nvim_replace_termcodes("<C-^>", true, false, true)
        vim.api.nvim_feedkeys(key, 'i', false)
    end
    local current_spelllang = vim.opt.spelllang:get()[1]
    if current_spelllang == "el" then
        vim.opt.spelllang = "en"
        vim.opt.keymap = ""
    else
        vim.opt.spelllang = "el"
        vim.opt.keymap = "greek_utf-8"
    end
end

return M
