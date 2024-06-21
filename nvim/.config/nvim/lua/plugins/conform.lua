return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({

			format_on_safe = {
				async = true,
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				--python = { "isort", "black" },
				javascript = { "prettier" },
				vue = { "prettier" },
				javascriptvue = { "prettier" },
				typescriptvue = { "prettier" },
				html = { "prettier" },
				scss = { "prettier" },
				css = { "prettier" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({
				async = true,
				timeout_ms = 500,
				lsp_fallback = true,
			})
		end)
	end,
}
