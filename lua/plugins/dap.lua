return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio'
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            require('nvim-dap-virtual-text').setup()
            local opts = { noremap = true, silent = true }
            local keymap = vim.api.nvim_set_keymap
            -- Save breakpoints to file automatically.
            keymap("n", "<leader>db", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
            keymap("n", "<leader>dm", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
            keymap("n", "<leader>dx", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
            keymap("n", "<leader>dl", "<cmd>lua require('persistent-breakpoints.api').set_log_point()<cr>", opts)

            -- vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
            vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = "DAP: Toggle Breakpoint" })
            vim.keymap.set('n', '<leader>dd', function() dapui.toggle() end, { desc = "DAPUI: Toggle UI" })

            vim.keymap.set("n", "<leader>dc", dap.continue)
            vim.keymap.set("n", "<leader>di", dap.step_into)
            vim.keymap.set("n", "<leader>do", dap.step_over)
            vim.keymap.set("n", "<leader>du", dap.step_out)
            vim.keymap.set("n", "<leader>de", dap.step_back)
            vim.keymap.set("n", "<leader>dr", dap.restart)
            vim.keymap.set("n", "<leader>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
            vim.fn.sign_define('DapBreakpoint', { text='●', texthl='DapBreakpoint',  numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected', { text='⮿', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
            vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            -- dap.listeners.before.event_terminated.dapui_config = function()
                --   dapui.close()
                -- end
                -- dap.listeners.before.event_exited.dapui_config = function()
                    --   dapui.close()
                    -- end
        end
    },
    {
        'leoluz/nvim-dap-go',
        config = function()
            require('dap-go').setup()
        end
    },
    {
        'mfussenegger/nvim-dap-python',
        config = function()
            local root = vim.fs.dirname(
                vim.fs.find(".git", {
                    upward = true,
                    type = "directory",
                })[1]
            )
            require("dap-python").setup(root .. "/venv/bin/python")
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text'
    },
    {
        'Weissle/persistent-breakpoints.nvim',
        config = function()
            require('persistent-breakpoints').setup{
                load_breakpoints_event = { "BufReadPost" }
            }
        end
    }
}
