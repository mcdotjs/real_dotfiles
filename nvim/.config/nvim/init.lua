local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local augroup = vim.api.nvim_create_augroup
local MoveNCodeGroup = augroup("moveNcode", {})
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = MoveNCodeGroup,
-- 	callback = function()
-- 		if vim.bo.filetype == "go" then
-- 			vim.cmd.colorscheme("rose-pine-moon")
-- 		else
-- 			vim.cmd.colorscheme("tokyonight-night")
-- 		end
-- 	end,
-- })

vim.diagnostic.config({
	virtual_text = true, -- Enable virtual text
	signs = true, -- Enable signs
	underline = true, -- Enable underline
	update_in_insert = false, -- Do not update diagnostics in insert mode
	severity_sort = true, -- Sort diagnostics by severity
})

--plugins - are loaded automaticallz from local lua/plugins
require("options")
vim.cmd([[hi @function.builtin guifg=pink]])
--vim.cmd([[hi @variable.typescript guifg=red]])
require("lazy").setup("plugins")
