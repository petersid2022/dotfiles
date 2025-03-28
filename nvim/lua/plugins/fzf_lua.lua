return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require 'fzf-lua'

        -- max-perf profile
        fzf.setup {
            { "default-title" },
            desc = "fzf-native with no git|files icons",
            winopts = { preview = { default = "bat" }, treesitter = false, fullscreen = true },
            manpages = { previewer = "man_native" },
            helptags = { previewer = "help_native" },
            defaults = { git_icons = false, file_icons = false },
            lsp = { code_actions = { previewer = "codeaction_native" } },
            tags = { previewer = "bat" },
            btags = { previewer = "bat" },
            files = { fzf_opts = { ["--ansi"] = false } },
            grep = {
                fzf_opts  = { ["--ansi"] = false },
                rg_glob   = false, -- will trigger `opts.requires_processing`
                grep_opts = require("fzf-lua.utils").is_darwin()
                    and "--color=never --binary-files=without-match --line-number --recursive --extended-regexp -e"
                    or "--color=never --binary-files=without-match --line-number --recursive --perl-regexp -e",
                rg_opts   =
                " --color=never --column --line-number --no-heading --smart-case --max-columns=4096 -e",
            },
        }

        vim.keymap.set("n", "<leader>wd", fzf.diagnostics_workspace)
        vim.keymap.set("n", "<leader>d", fzf.diagnostics_document)
        vim.keymap.set("n", "<leader>ff", fzf.files)
        vim.keymap.set("n", "<leader>fs", fzf.live_grep_native)
        vim.keymap.set("n", "<leader>sw", fzf.grep_cword)
        vim.keymap.set("n", "<leader>gf", fzf.git_files)
        vim.keymap.set("n", "<leader>gs", fzf.git_status)
        vim.keymap.set("n", "<leader>sp", fzf.spell_suggest)
        vim.keymap.set("n", "<leader>ht", fzf.helptags)
        vim.keymap.set("n", "<leader>bb", fzf.buffers)
        vim.keymap.set("n", "<leader>hm", fzf.manpages)
        vim.keymap.set("n", "<leader>co", fzf.colorschemes)
    end,
}
