return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = {
		advanced = {
			discord = {
				reconnect = {
					enabled = true,
				},
			},
		},
	},
}
