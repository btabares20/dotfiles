return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "horizontal",
                size = 15,
                start_in_insert = true,
            })

            local Terminal = require("toggleterm.terminal").Terminal
            local term = nil

            vim.keymap.set("n", "<leader>t", function()
                local cwd = vim.fn.expand("%:p:h")

                if term == nil or term.dir ~= cwd then
                    term = Terminal:new({
                        direction = "horizontal",
                        size = 15,
                        cwd = cwd,
                        on_open = function(t)
                            t:send("[ -f ./venv/bin/activate ] && source ./venv/bin/activate", false)
                        end,
                    })
                end

                term:toggle()
            end, { desc = "Toggle terminal in current file directory" })
        end,
    },
}
