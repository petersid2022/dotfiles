local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-live-grep-args.nvim" }
    },
    config = function()
        require("telescope").load_extension("live_grep_args")
    end
}

use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end, }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }


    use { "ellisonleao/gruvbox.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }

    use 'nvim-tree/nvim-web-devicons'

    --use {
        --    'nvim-lualine/lualine.nvim',
        --    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        --}

        use { "https://github.com/github/copilot.vim" }

        use "ThePrimeagen/harpoon"
        use "tpope/vim-fugitive"
        use "folke/tokyonight.nvim"
        use "ziglang/zig.vim"

        -- installing markdown preview
        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })
        use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

        -- installing markdown preview

        -- installing lsp_lines (https://git.sr.ht/~whynothugo/lsp_lines.nvim)
        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            config = function()
                require("lsp_lines").setup()
            end,
        })
        -- installing lsp_lines (https://git.sr.ht/~whynothugo/lsp_lines.nvim)

        if packer_bootstrap then
            require('packer').sync()
        end
    end)
