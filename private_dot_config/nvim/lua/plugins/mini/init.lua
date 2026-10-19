-- enhanced, a and i keybinds
require("mini.ai").setup()

require("mini.align").setup()

-- shows indent symbol in block where the cursor sits
require("mini.indentscope").setup({
	symbol = "│",
	draw = {
		animation = require("mini.indentscope").gen_animation.none(),
	},
})

-- auto pairs
require("mini.pairs").setup()

-- access to surround keymaps sa,sd,sc etc
require("mini.surround").setup()

-- icons, replace nvim_web_devicons
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

-- better jump capabilities
require("mini.jump").setup()

-- git diff
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "┃", change = "┃", delete = "┃" },
	},
})

-- toggle formatting of brackets
require("mini.splitjoin").setup({
	mappings = {
		toggle = "<leader>m",
	},
})

-- a bit nicer status line
--require("mini.statusline").setup()

require("plugins.mini.notify")
require("plugins.mini.completions")


-- load and configure mini picker
require("plugins.mini.picker")
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>", { desc = "Pick file" })
vim.keymap.set('n', '<leader>fg', ":Pick grep_live<CR>", { desc = "Pick grep live" })
