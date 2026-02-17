vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

--vim.keymap.set('v', '<leader>s',  ":SSSelected" )
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true, desc = "Toggle comment" })
vim.keymap.set('v', '<C-/>', 'gc', { remap = true, desc = "Toggle comment" })

-- very nice
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- these make sure that the cursor is in mid screen when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- prevents override of current buffer when pasting/deleting
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_dP")
vim.keymap.set("v", "<leader>d", "\"_dP")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>") -- IMPORTANT!!
-- tmux sessionizer ctrl shortcut
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

-- magic???
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- turns things into executable things
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- laziness
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- go convenience thingies
vim.keymap.set( "n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>" )
vim.keymap.set( "n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a" )
vim.keymap.set( "n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj" )
vim.keymap.set( "n", "<leader>el", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i" )

