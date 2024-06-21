return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	--TODO: testujeme
	--HACK: hackujeme
	--BUG: posralo sa
	--INFO: onfo
	--PERF: performance
	--NOTE: fgvd
	--WARN: warning
	config = function()
		require("todo-comments").setup()
	end,
}
