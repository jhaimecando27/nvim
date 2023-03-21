require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
