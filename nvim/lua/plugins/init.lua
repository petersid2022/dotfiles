---@diagnostic disable: different-requires
local plugins = {
    { lazy = true,                       'nvim-lua/plenary.nvim' },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'plugins.configs.tokyonight'
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                build = 'make install_jsregexp'
            },
            {
                'rafamadriz/friendly-snippets',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        },
        config = function()
            require 'plugins.configs.cmp'
        end,
    },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            {
                'williamboman/mason.nvim',
                config = function()
                    require 'plugins.configs.mason'
                end
            },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'j-hui/fidget.nvim',
                config = function()
                    require 'plugins.configs.fidget'
                end
            },
        },
        config = function()
            require 'plugins.configs.lsp'
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        cond = function()
            local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')
            if git_dir ~= "" then
                return true
            end
        end,
        opts = {},
    },
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        branch = '0.1.x',
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        config = function()
            require "plugins.configs.telescope"
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
        build = ':TSUpdate',
        config = function()
            require "plugins.configs.treesitter"
        end,
    },
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Undotree: Toggle window' },
        },
    },
    {
        'otavioschwanck/arrow.nvim',
        keys = ';',
        opts = {
            relative_path = true,
            show_icons = false,
            leader_key = ';',
            mappings = {
                clear_all_items = "D",
            },
            full_path_list = {}
        },
    },
    {
        'echasnovski/mini.statusline',
        version = false,
        config = function()
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = false }

            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%2l:%-2v'
            end
            statusline.section_fileinfo = function()
                return ''
            end
        end
    },
    {
        'folke/trouble.nvim',
        event = 'VeryLazy',
        config = function()
            require 'plugins.configs.trouble'
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4',
        ft = { 'rust' },
    },
    {
        'luckasRanarison/tailwind-tools.nvim',
        ft = { 'javascript', 'typescript' },
        opts = {}
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { import = 'plugins.configs.copilot' },
}

require('lazy').setup(plugins, require 'plugins.configs.lazy')
