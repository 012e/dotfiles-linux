local pluginConfs = require("custom.plugins.configs")

local M = {}

M.plugins = require("custom.plugins")

M.ui = {
	theme = "gruvbox",
	hl_override = {
		CursorLine = {
			bg = "one_bg",
		},
	},
}

M.mappings = require("custom.mappings")

return M
