# Neovim
This is my build/configuration of [Neovim From Scratch](https://github.com/LunarVim/Neovim-from-scratch).

## Changes
1. plugins.lua
    - preservim/tagbar
    - Added more color schemes
      - dracula
      - tomorrow-theme
      - gruvbox
      - ayu-vim
      - onedark
2. Keymaps.lua
```lua
-- Normal --
-- Faster enter to command mode
keymap("n", ";", ":", opts)

-- Insert --
-- Make faster to exit
keymap("i", "<C-j>", "<ESC>j", opts)
keymap("i", "<C-k>", "<ESC>k", opts)
```
3. colorscheme.lua
```lua
vim.cmd [[
try
  colorscheme ayu
]]
```
4. options.lua
```lua
termguicolors = true
```
5. whickey.lua
    - I change shortcut key for terminal to letter "T" and set `TagbarToggle` to letter "t"
6. alpha.lua
    - I changed the footer name to my name
