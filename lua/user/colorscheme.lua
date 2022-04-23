vim.cmd [[
try
  set background=light
  colorscheme gruvbox
  set guicursor+=i:block-cursor
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
