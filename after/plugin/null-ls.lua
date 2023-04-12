local null_ls_ok, null_ls = pcall(require, "null_ls")
if not null_ls_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    sources = {
        formatting.prettier,
        formatting.black,
        formatting.stylua,
        formatting.google_java_format,

        diagnostics.flake8,
    },
}
