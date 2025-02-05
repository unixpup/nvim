return {
	"rebelot/heirline.nvim",
	dependencies = { "Zeioth/heirline-components.nvim" },
	opts = {},
	config = function(_, opts)
		local heirline = require("heirline")
		local heirline_components = require("heirline-components.all")

		-- Setup
		heirline_components.init.subscribe_to_events()
		heirline.load_colors(heirline_components.hl.get_colors())
		heirline.setup(opts)
	end,
}
