vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>qc", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change all word' })
--
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")
vim.keymap.set("n", "<BS>", "ciw", { desc = 'Delete a word' })
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { desc = 'Delete a word' })
-- vim.keymap.set("i", "<C-H>", "<Esc>cvb",{desc = 'Delete a word'})
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("i", "<C-b>", "<Esc>^i", { desc = "Beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

vim.keymap.set("n", "<A-c>", "<CMD>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<A-t>", "<CMD>tabclose<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>ct", "<CMD>tabnew<CR>", { desc = "Create tab" })

-- vim.keymap.set("n", "<C-n>", "*Ncgn", { silent = true, desc = "Substitute word under cursor" })
-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { desc = "Resize window up" });
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { desc = "Resize window down" });
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = "Resize window right" });
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = "Resize window left" });

-- navigate within insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
--
-- Use <Tab> to cycle through buffers in tab
vim.keymap.set('n', '<Tab>', '<C-W>w');
vim.keymap.set('n', '<S-Tab>', '<C-W>W');

vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- -- Toggle Term
-- nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
-- inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
-- vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>', {desc = "Toggle Term"});
-- vim.keymap.set('i', '<C-t>', ':ToggleTerm<CR>', {desc = "Toggle Term"});
-- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
-- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
-- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
-- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
-- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
-- }

return {

}
