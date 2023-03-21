vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").setup({
		window = {
			width = 90,
			height = 0.9,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
				colorcolumn = "",
				wrap = true,
				linebreak = true,
			},
		},
	})
	require("zen-mode").toggle()
end)
