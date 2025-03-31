return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		integrations = {
			-- Fixes lspconfig's workspace management for LuaLS
			-- Only create a new workspace if the buffer is not part
			-- of an existing workspace or one of its libraries
			lspconfig = true,
			-- add the cmp source for completion of:
			-- `require "modname"`
			-- `---@module "modname"`
			cmp = true,
			-- same, but for Coq
			coq = true,
		},
		library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
