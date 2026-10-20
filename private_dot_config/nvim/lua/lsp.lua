-- lsp
vim.lsp.enable({
	"lua_ls",
	"clangd",
  "neocmakelsp",
  "bashls",
  "rust_analyzer",
})

-- configure neocmakelsp
vim.lsp.config("neocmakelsp", {})


-- configure clangd
vim.lsp.config("clangd", {
		cmd = {
			"clangd",
			"--background-index",            --
			"--clang-tidy",                  -- 
			"--query-driver=/usr/bin/**", -- force to look for specific compiler (such as gcc) 
		},
		root_markers = {
			"compile_commands.json", -- standard file to find going up the dir hierarchy
			-- ".git",               -- fallback
		},
})

-- grd does not work if there is no definition
vim.keymap.set('n', '<leader>ct', '<cmd>LspClangdSwitchSourceHeader<CR>', { desc='Switch between source and header' })

-- general lsp configs

-- alternative to Ctrl-], 
--   grr - references
--   gri - implementations
--   grn - rename
--   gra - code actions
--   grx - code lense
--   K   - show doc 
vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { desc='Go to definition' })

-- show as virtual text in a float
vim.diagnostic.config({ virtual_text = true })

-- show completion while typing
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- add noselect as standard if nothing chosen
vim.cmd("set completeopt+=noselect")

-- format
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc='Format this buffer' })

-- show list of diagnostics of this buffer
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Buffer diagnostics' })
