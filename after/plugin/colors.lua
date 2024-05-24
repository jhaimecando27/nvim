local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_ok then
	return
end

local monokai_pro_ok, monokai_pro = pcall(require, "monokai-pro")
if not monokai_pro_ok then
	return
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = {
		light = "latte",
		dark = "mocha",
	},
})

monokai_pro.setup({
	transparent_background = false,
	terminal_colors = true,
	filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
})

-- setup must be called before loading
vim.cmd.colorscheme("monokai-pro")
vim.cmd("hi StatusLine guifg=black guibg=white")

-- Minimal statusline
-- REF: https://www.reddit.com/r/neovim/comments/maragr/minimal_statusline_in_lua/
local fn, cmd = vim.fn, vim.cmd
function my_statusline()
  local branch = fn.FugitiveHead()

  if branch and #branch > 0 then
    branch = '  '..branch
  end

  return branch..' %f%m%=%l:%c'
end
cmd("set statusline=%!luaeval('my_statusline()')")
