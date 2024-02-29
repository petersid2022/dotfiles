local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- Set the cursor at the same location as it was before
-- vim.api.nvim_create_autocmd('BufReadPost', { command = 'silent! normal! g`"zv' })

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.g.mapleader = " "

require("lazy").setup({
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "gruvbox"
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = 'VeryLazy',
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ':TSUpdate',
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = false },
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} }
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp"
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
		},
	},
	{
		"otavioschwanck/arrow.nvim",
		opts = {
			show_icons = false,
			leader_key = ';'
		},
	},
	{
		"echasnovski/mini.statusline",
		version = false,
		config = function()
			local status_line = require('mini.statusline')
			status_line.setup({ use_icons = false })
			status_line.section_location = function ()
				return ''
			end
			status_line.section_fileinfo = function ()
				return ''
			end
		end
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		enabled = function() return vim.fn.getcwd() == vim.fn.expand("/home/petrside/vaults/work") end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			disable_frontmatter = true,
			daily_notes = {
				folder = "Daily",
			},
			workspaces = {
				{
					name = "work",
					path = "~/vaults/work",
				},
			},
		},
	}
})
require("petrside")
