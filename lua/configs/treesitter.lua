local options = {
	ensure_installed = {
		"lua",
		"luadoc",
		"printf",
		"vim",
		"vimdoc",
		"markdown",
		"json",
		"bash",
		"go",
		"gomod",
		"html",
		"css",
		"yaml",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
