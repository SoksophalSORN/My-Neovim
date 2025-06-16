require "nvchad.mappings"

local M = {}

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Map the jj sequence to Esc only in insert and visual modes
map("i", "jj", "<Esc>", { noremap = true, silent = true })
map("v", "jj", "<Esc>", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


map("n", "<leader>e", function()
  vim.diagnostic.open_float({ focusable = false })
end, { desc = "Show diagnostics in floating window" })

return M
