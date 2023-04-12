local zen_mode_ok, zen_mode = pcall(require, "zen_mode")
if not zen_mode_ok then
	return
end

vim.keymap.set("n", "<leader>zz", function()
	zen_mode.setup({
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
	zen_mode.toggle()
end)
