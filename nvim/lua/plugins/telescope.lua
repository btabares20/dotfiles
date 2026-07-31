return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope.nvim', 
        dependencies=  {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')
            local telescope = require("telescope").extensions.git_worktree
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ")});
            end)
            vim.keymap.set("n", "<leader>gw", telescope.git_worktrees, {
                desc = "Git Worktrees",
            })

            vim.keymap.set("n", "<leader>gW", telescope.create_git_worktree, {
                desc = "Git Create Worktree",
            })
            require('telescope').load_extension('fzf')
        end,
    },
}
