local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    { "ellisonleao/gruvbox.nvim",         priority = 1000,    config = true, opts = ... },
    "nvim-lua/plenary.nvim",
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.2",
        build = ":TSUpdate"
    },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'catppuccin/nvim',                  name = 'catppuccin' },
    -- {
    --     "ThePrimeagen/harpoon",
    --     branch = "harpoon2",
    --     dependencies = { "nvim-lua/plenary.nvim" }
    -- },
    { "ThePrimeagen/harpoon" },
    { 'nvim-tree/nvim-web-devicons' },
    -- {
    --     "folke/trouble.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     opts = {},
    -- },
    { 'Shatur/neovim-ayu' },
    {
        "folke/zen-mode.nvim",
        opts = {},
    },
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     init = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --     end,
    -- },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    { "mbbill/undotree" },
    { "f-person/git-blame.nvim" },
})

require("petrside.remap")
require("petrside.set")
vim.opt.langmap =
"ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"
vim.wo.sidescrolloff = 40
