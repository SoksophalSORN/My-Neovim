-- ~/.config/nvim/lua/custom/configs/cmp.lua
local cmp = require("cmp")
cmp.setup({
  sources = cmp.config.sources({
    { name = "copilot" },      -- 👈 add Copilot first for priority
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }),
})

return cmp
