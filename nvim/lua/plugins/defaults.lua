return {
    {'theprimeagen/vim-be-good', event="VeryLazy"},
    {'nvim-treesitter/nvim-treesitter-context', event="VeryLazy"},
    {'stevearc/dressing.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'MunifTanjim/nui.nvim'},
    {'hrsh7th/nvim-cmp'},
    {'nvim-tree/nvim-web-devicons'},
    {'HakonHarnes/img-clip.nvim'},
    {'folke/which-key.nvim',
    config = function()
        require("which-key").setup()
    end},
    {
        "sphamba/smear-cursor.nvim",

        opts = {
            cursor_color = "#61AFEF",
            stiffness = 0.8,                      -- 0.6      [0, 1]
            trailing_stiffness = 0.6,             -- 0.45     [0, 1]
            stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
            trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
            damping = 0.95,                       -- 0.85     [0, 1]
            damping_insert_mode = 0.95,           -- 0.9      [0, 1]
            distance_stop_animating = 0.5,
        }
    },
    {
      "karb94/neoscroll.nvim",
      opts = {
          mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
              '<C-u>', '<C-d>',
              '<C-b>', '<C-f>',
          },
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          duration_multiplier = 1.0,   -- Global duration multiplier
          easing = 'linear',           -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,             -- Function to run after the scrolling animation ends
          performance_mode = false,    -- Disable "Performance Mode" on all buffers.
          ignored_events = {           -- Events ignored while scrolling
              'WinScrolled', 'CursorMoved'
          },
      },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {}
    }
}
