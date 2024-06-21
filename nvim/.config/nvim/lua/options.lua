vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set scrolloff=10")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set hlsearch")
vim.cmd("set splitright")
vim.cmd("set splitkeep=cursor")
vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Decrease update time
vim.opt.updatetime = 250
-- Save undo history
vim.opt.undofile = true
--vim.highlight.Normal.guibg=none
-- highlight NonText guibg=none
-- highlight Normal ctermbg=none
-- highlight NonText ctermbg=none
-- Displays which-key popup sooner
--vim.opt.timeoutlen = 300
--???????
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--vim.opt.list = true
--vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<C-j>", ":cprev<CR>", { desc = "prev item in quickfix list" })
vim.keymap.set("n", "<C-k>", ":cnext<CR>", { desc = "next item in quickfix list" })

--make file executable
vim.keymap.set("n", "<leader>x", "x :!chmod +x %<CR>", { desc = "make file executable" })

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer", { desc = "tmux-sessionizer" })

vim.keymap.set({ "n", "i" }, "<C-s>", ":w <CR>", { desc = "save file" })