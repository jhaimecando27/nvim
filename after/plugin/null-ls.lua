local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    sources = {
        formatting.prettier,
        formatting.autopep8,
        formatting.stylua,

        diagnostics.flake8,
    },
}
