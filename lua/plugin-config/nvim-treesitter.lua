require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"css",
		"vim",
		"lua",
		"javascript",
		"typescript",
		"go",
		"vue",
		"c",
		"cpp",
		"java",
		"php",
		"json",
		"json5",
		"jsonc",
		"python",
		"bash",
		"yaml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = { "go" },
	},
	-- 启用增量选择
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "<CR>",
			node_decremental = "<BS>",
		},
	},
})
-- 开启 Folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
