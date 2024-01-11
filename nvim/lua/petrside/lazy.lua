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
    "nvim-lua/plenary.nvim",

    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.4",
        dependencies = "nvim-lua/plenary.nvim",
    },

    "nvim-treesitter/nvim-treesitter-context",

    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'catppuccin/nvim',                  name = 'catppuccin' },
    { 'ThePrimeagen/harpoon' },
    { 'f-person/git-blame.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    { 'Shatur/neovim-ayu' },
    {
        "folke/zen-mode.nvim",
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    { "mbbill/undotree" }
})
