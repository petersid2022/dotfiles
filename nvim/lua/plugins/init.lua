local plugins = {
	{ lazy = true,                  "nvim-lua/plenary.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			on_highlights = function(hl, colors)
				hl.LineNr = {
					fg = colors.yellow
				}
				hl.CursorLineNr = {
					fg = colors.yellow
				}
			end
		}
	},
	{
		'tpope/vim-fugitive',
		cond = function()
			local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ";")
			if git_dir ~= "" then
				return true
			end
		end,
	},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				build = 'make install_jsregexp'
			},
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
		},
		config = function()
			require "plugins.configs.cmp"
		end,
	},
	{
		'neovim/nvim-lspconfig',
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				'williamboman/mason.nvim',
				config = function()
					require "plugins.configs.mason"
				end
			},
			{ 'williamboman/mason-lspconfig.nvim' },
			{
				'j-hui/fidget.nvim',
				config = function()
					require "plugins.configs.fidget"
				end
			},
		},
		config = function()
			require "plugins.configs.lsp"
		end,
	},
	{
		'lewis6991/gitsigns.nvim',
		cond = function()
			local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ";")
			if git_dir ~= "" then
				return true
			end
		end,
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" }
			},
		},
	},
	{
		'mfussenegger/nvim-dap',
		dependencies = { 'rcarriga/nvim-dap-ui', opts = {} },
		config = function()
			require "plugins.configs.dap"
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		config = function()
			require "plugins.configs.telescope"
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
		config = function()
			require "plugins.configs.treesitter"
		end,
	},
	{
		'mbbill/undotree',
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree: Toggle window" },
		},
	},
	{
		'otavioschwanck/arrow.nvim',
		keys = ';',
		opts = {
			show_icons = false,
			leader_key = ';',
			mappings = {
				clear_all_items = "D",
			},
		},
	},
	{ dir = "~/github/nvim-linefly" },
}

require("lazy").setup(plugins, require "plugins.configs.lazy")
