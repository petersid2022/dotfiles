local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd('BufReadPost', { command = 'silent! normal! g`"zv' })

vim.g.mapleader = " "

require("lazy").setup({
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'gruvbox'
		end,
	},
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		tag = '0.1.5',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
			{ 'nvim-tree/nvim-web-devicons',            lazy = true },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			{ 'j-hui/fidget.nvim', opts = {} }
		},
	},
	{
		'hrsh7th/nvim-cmp',
		lazy = false,
		event = 'InsertEnter',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				build = (function()
					if vim.fn.has 'win32' == 1 then
						return
					end
					return 'make install_jsregexp'
				end)(),
			},
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'rafamadriz/friendly-snippets',
		},
	},
	{
		"mbbill/undotree",
	},
	{
		'echasnovski/mini.statusline',
		version = false,
		config = function()
			require('mini.statusline').setup({ use_icons = false })
		end
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
})

require("petrside.remap")
require("petrside.set")
