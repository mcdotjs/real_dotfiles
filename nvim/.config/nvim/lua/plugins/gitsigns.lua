return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			-- vim.keymap.set("n", "ga", ":Git add ", { desc = "git add" })
			-- vim.keymap.set("n", "gm", ':Git commit -m "', { desc = "git commit " })
			-- vim.keymap.set("n", "gs", ":Git status<CR>", { desc = "git status" })
			-- vim.keymap.set("n", "gp", ":Git pull<CR>", { desc = "git pull" })
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "line changes - git preview" })
			vim.keymap.set(
				"n",
				"<leader>gt",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "git blame current line" }
			)
			print("Ahoj mirko")
		end,
	},
}
