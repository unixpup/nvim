return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	config = function()
		require("trouble").setup({
			auto_close = true, -- auto close when there are no items
			auto_open = false, -- auto open when there are items
			auto_preview = true, -- automatically open preview when on an item
			auto_refresh = true, -- auto refresh when open
			auto_jump = true, -- auto jump to the item when there's only one
			focus = true, -- Focus the window when opened
			restore = true, -- restores the last location in the list when opening
			follow = true, -- Follow the current item
			indent_guides = true, -- show indent guides
			max_items = 200, -- limit number of items that can be displayed per section
			multiline = true, -- render multi-line messages
			pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
			warn_no_results = true, -- show a warning when there are no results
			open_no_results = false, -- open the trouble window when there are no results
			---@type table<string, trouble.Mode>
			modes = {
				-- sources define their own modes, which you can use directly,
				-- or override like in the example below
				lsp_references = {
					-- some modes are configurable, see the source code for more details
					params = {
						include_declaration = true,
					},
				},
				-- The LSP base mode for:
				-- * lsp_definitions, lsp_references, lsp_implementations
				-- * lsp_type_definitions, lsp_declarations, lsp_command
				lsp_base = {
					params = {
						-- don't include the current location in the results
						include_current = true,
					},
				},
				symbols = {
					desc = "document symbols",
					mode = "lsp_document_symbols",
					focus = false,
					win = { position = "right" },
					filter = {
						-- remove Package since luals uses it for control flow structures
						["not"] = { ft = "lua", kind = "Package" },
						any = {
							-- all symbol kinds for help / markdown files
							ft = { "help", "markdown" },
							-- default set of symbol kinds
							kind = {
								"Class",
								"Constructor",
								"Enum",
								"Field",
								"Function",
								"Interface",
								"Method",
								"Module",
								"Namespace",
								"Package",
								"Property",
								"Struct",
								"Trait",
							},
						},
					},
				},
			},
			icons = {
				---@type trouble.Indent.symbols
				indent = {
					top = "│ ",
					middle = "├╴",
					last = "└╴",
					fold_open = " ",
					fold_closed = " ",
					ws = "  ",
				},
				folder_closed = " ",
				folder_open = " ",
				kinds = {
					Array = " ",
					Boolean = "󰨙 ",
					Class = " ",
					Constant = "󰏿 ",
					Constructor = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Function = "󰊕 ",
					Interface = " ",
					Key = " ",
					Method = "󰊕 ",
					Module = " ",
					Namespace = "󰦮 ",
					Null = " ",
					Number = "󰎠 ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					String = " ",
					Struct = "󰆼 ",
					TypeParameter = " ",
					Variable = "󰀫 ",
				},
			},
		})
	end,
}
