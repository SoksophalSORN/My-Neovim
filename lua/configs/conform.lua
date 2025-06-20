local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
        lsp_format = "fallback", -- Use LSP formatter if no conform formatter is found
        timeout_ms = 500,
        async = true, -- <--- ADD THIS LINE (or false for sync debugging)
        -- Consider adding notify_on_error for better feedback:
        notify_on_error = true,
  },
}

return options
