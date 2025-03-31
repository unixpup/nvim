return {
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
	config = function()
		local actions = require("telescope.actions")
		local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add
		require("telescope").setup({
			mappings = {
				i = { ["<c-t>"] = open_with_trouble },
				n = { ["<c-t>"] = open_with_trouble },
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		-- To get fzf loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("noice")
	end,
}
