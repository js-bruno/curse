return {
  'mistweaverco/bafa.nvim',
  version = 'v1.12.3',
  keys = {
    { '<leader>e', function() require('bafa').toggle() end, desc = 'Bafa: buffer list' },
    -- open directly with jump-labels visible
    { '<leader>E', function() require('bafa').toggle({ with_jump_labels = true }) end, desc = 'Bafa: buffer list (jump-labels)' },
  },
  opts = {
    -- 🔔 Notification configuration
    notify = {
      -- Used for for feedback messages
      -- Anything that has a `vim.notify` like interface will work
      -- e.g. `juu.notify`, `telescope.notify`, etc.
      -- print is also supported,
      -- even though it's does not implement the notify interface
      provider = "vim.notify",
    },
    ui = {
      -- 🪄 Rendering configuration
      render = {
        -- Custom buffer line format function, default is nil.
        -- The function receives a BafaUiBufferLine as argument
        -- and should return a string to be displayed in the UI.
        custom_format_buffer_line = nil,
      },
      -- 🧭 Buffer ordering configuration
      sort = {
        -- Buffer ordering strategy
        -- "default" | "last_used" | "manual"
        -- "default": Buffers are ordered by last usage time
        -- "last_used": Buffers are ordered by their buffer number
        -- "manual": Buffers are ordered manually by the user
        method = "default",
        -- Only applicable when `method` is "default" or "last_used"
        -- When true, instead of focusing the current buffer,
        -- the previously used buffer will be focused when opening the UI
        focus_alternate_buffer = false,
      },
      -- 🦘 Jump-labels configuration
      jump_labels = {
        -- Keys to use for jump-labels
        -- in order of preference
        -- Should be unique characters
        -- Duplicates will be ignored
        -- require('bafa.utils.keys').protected_jump_label_keys
        -- are also protected and will be ignored
        -- You can customize this to your keyboard layout
        -- will also use uppercase variants of these keys
        -- if the lower-case ones are exhausted
        -- This should give us roughly 46 unique keys (minus the protected ones)
        -- That should be enough for most use-cases
        -- but when we run out of keys, only the first buffers (in order, from top to bottom)
        -- will get jump-labels assigned
        keys = {
          "a", "s", "d", "f", "j", "k", "l", ";",
          "q", "w", "e", "r", "u", "i", "o", "p",
          "z", "x", "c", "n", "m", ",", ".",
        }
      },
      -- 🚨 Show diagnostics in the UI
      diagnostics = true,
      -- 📄 Show line numbers in the UI
      line_numbers = false,
      -- 👀 Title configuration
      title = {
        -- Title of the floating window
        text = "👀",
        -- Position of the title: "left", "center", "right"
        -- See `:h nvim_open_win` for more details
        pos = "center",
      },
      -- 🎨 Floating window border configuration
      -- Floating window border: "single", "double", "rounded", "solid", "shadow", or a table
      -- See `:h nvim_open_win` for more details on custom borders
      border = "rounded",
      -- 🎨 Floating window style configuration
      -- Floating window style: "minimal", "normal"
      -- See `:h nvim_open_win` for more details
      style = "minimal",
      -- 📏 Floating window alignment configuration
      position = {
        -- Window position preset:
        -- "center", "top-center", "bottom-center", "top-left", "top-right",
        -- "bottom-left", "bottom-right", "center-left", "center-right"
        preset = "center",
        -- Custom row position (overrides preset if set)
        -- also supports a function that returns a number
        row = nil,
        -- Custom column position (overrides preset if set)
        -- also supports a function that returns a number
        col = nil,
      },
      -- 💄 Icons configuration
      icons = {
        -- 🚨 Diagnostics icons configuration
        diagnostics = {
          Error = "",   -- Icon for error diagnostics
          Warn = "",    -- Icon for warning diagnostics
          Info = "",    -- Icon for info diagnostics
          Hint = "",    -- Icon for hint diagnostics
        },
        -- 🖊️ Buffer changes sign configuration
        sign = {
          changes = "┃", -- Sign character for modified/deleted buffers
        },
      },
      -- 🎨 Highlight groups configuration
      hl = {
        -- 🖊️ Buffer changes sign highlight groups configuration
        sign = {
          modified = "GitSignsChange", -- Highlight group for modified buffer signs (fallback: DiffChange)
          deleted = "GitSignsDelete", -- Highlight group for deleted buffer signs (fallback: DiffDelete)
        },
      },
    },

  };
}
