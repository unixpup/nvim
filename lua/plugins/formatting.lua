return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettier" },
				javascript = { "prettier" },
				css = { "prettier" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "first",
			},
		})
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
