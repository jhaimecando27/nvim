local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_ok then
	return
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

vim.cmd("hi StatusLine guifg=black guibg=white")

require('lualine').setup()
