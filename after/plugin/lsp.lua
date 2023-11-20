local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
	return
end

local config_ok, config = pcall(require, "lspconfig")
if not config_ok then
	return
end

local fidget_ok, fidget = pcall(require, "fidget")
if fidget_ok then
    fidget.setup {}
end

lsp.preset("recommended")

lsp.ensure_installed({
	"pylsp",
	"tsserver",
	"lua_ls",
	"cssls",
	"html",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    -- Let null-ls do the formatter
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "pylsp" then
		client.server_capabilities.documentFormattingProvider = false
	end
end

lsp.on_attach(on_attach)

config["dartls"].setup({
    on_attach = on_attach
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
