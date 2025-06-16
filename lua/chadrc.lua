-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvbox",
    transparency = true,

    hl_override = {
         Comment = { italic = true , fg = "#d8cba2"},
         Visual = { bg = "#665c54" }
    },
}

-- M.term = {
--     base46_colors = true,
-- }

-- M.nvdash = { load_on_startup = true }
M.ui = {
    theme = "gruvbox",
    tabufline = {
    }
}

-- require("lazy").setup({
--   checker = { enabled = true, notify = false }, -- automatically check for plugin updates
-- })

vim.cmd [[
  let g:copilot_no_tab_map = v:true
  imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
]]

return M
