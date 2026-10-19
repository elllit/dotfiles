vim.pack.add({
	"https://github.com/martindur/zdiff.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/refractalize/oil-git-status.nvim",
	"https://github.com/stevearc/oil.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
}
)

require("lualine").setup()


-- setup gitsigns (for inline blame)
require("gitsigns").setup({
  signs_staged_enable = false,
  signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  blame_formatter = nil, -- Use default
})

-- setup mini
require("plugins.mini")

-- setup oil
require("oil").setup({
  win_options = {
    signcolumn = "yes:2", -- make sure there is room for 2 more cols, needed for oil-git-status
  },
})
vim.keymap.set('n', '<leader>e', ":Oil --float<CR>", { desc = "Start Oil" })
require("oil-git-status").setup()

-- setup zdiff
require("zdiff").setup()
vim.keymap.set('n', '<leader>zd',
  -- change the path to the one of the file open in the current buffer
  -- this helps zdiff to find the git repo
  -- change the dir back in the end, even if the zdiff call fails
  function()
    local dir_name = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
    local old_dir = vim.fn.getcwd()
    if dir_name ~= ''  then
      vim.fn.chdir(dir_name)
    end

    local ok, err = pcall(
      function()
        require("zdiff").open()
      end)

    vim.fn.chdir(old_dir)

    if not ok then error(err) end
  end,
  { desc = 'Zdiff (uncommitted)'})
