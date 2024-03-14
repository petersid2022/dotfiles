require('fidget').setup {
	progress = {
		display = {
			done_icon = "",
			progress_icon = "",
		},
	},
	notification = {
		view = {
			icon_separator = ""
		},
		window = {
			x_padding = 0
		}
	},
	logger = {
		level = vim.log.levels.OFF,
		float_precision = 0.1,
	}
}
