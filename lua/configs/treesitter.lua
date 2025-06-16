local options = {
    ensure_installed = {
        "c", "cpp", "java", "python", "lua", "vim", "vimdoc",
        "html", "css", "javascript", "typescript", "json", "yaml", "markdown", "rust"
        -- Add any other languages you work with
    },

    -- Install parsers synchronously (build will run this for you)
    -- auto_install = true, -- You can enable this to auto-install missing parsers on file open, but ':TSUpdate' is generally preferred for control.

    highlight = {
          enable = true, -- Enables Tree-sitter highlighting
          -- disable = { "markdown" }, -- uncomment to disable for specific filetypes
          -- You can specify a list of filetypes to disable highlighting for.
          -- If `true`, it will fall back to Vim's regex highlighting.
          -- If `false`, no highlighting will be done.
          additional_vim_regex_highlighting = false, -- Set to true if you need old regex highlights as fallback for unparsed areas. Usually false is better.
    },

    indent = { enable = true }, -- Enables Tree-sitter based indentation

    -- Optional: Configure text objects
    textobjects = {
            select = {
            enable = true,
            -- You can use these keymaps to select tree-sitter nodes
            -- Example: `af` (a function), `if` (inner function)
            -- Recommended to map these in `keymaps.lua` or a separate `ts_keymaps.lua` if you use them heavily.
            -- Example:
            -- af = '@function.outer',
            -- if = '@function.inner',
            -- ac = '@class.outer',
            -- ic = '@class.inner',
            }, 
    },
    move = {
            enable = true,
            set_jumps = true, -- Set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },

            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },

            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
    }
}

return options
