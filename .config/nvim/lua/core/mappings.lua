local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
--keymap("n", "<F10>", ":NERDTreeToggle<cr>", opts)

-- Tagbar
keymap("n", "<F8>", ":TagbarToggle<cr>", opts)

-- Neotree
keymap("n", "<F10>", ":Neotree position=left<cr>", opts)
keymap("n", "<leader>t", ":Neotree position=float<cr>", opts)
--keymap("n", "<leader>T", ":Neotree position=current<cr>", opts)

keymap("n", "tm", "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap("n", "tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
keymap("n", "ts", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
keymap("n", "to", "<cmd>lua require('neotest').output.open()<cr>", opts)

--vim.g.neovide_input_use_logo = 1
--vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
