vim.cmd [[
try
  colorscheme dracula
  hi normal guibg=000000
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
