return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      -- This line is crucial. It tells conform.nvim to load the options
      -- defined in your configs/conform.lua file.
    require("configs.conform")
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  require("plugins.nvim-jdtls"),

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  --

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      require("configs.treesitter"),
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    keys = {
      { "<C-h>", mode = "n" },
      { "<C-j>", mode = "n" },
      { "<C-k>", mode = "n" },
      { "<C-l>", mode = "n" },
      { "<C-\\>", mode = "n" },
      { "<C-Space>", mode = "n" },
    },
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true,
      })

      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, opts)
      map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, opts)
      map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, opts)
      map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, opts)
      map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, opts)
      map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, opts)
    end,
  },

  {
    "github/copilot.vim",
    event = "VeryLazy",
    lazy = false, -- This is likely intended to make it load immediately despite "VeryLazy"
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  -- Copilot cmp integration
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Optional: Patch `nvim-cmp` to include Copilot source
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot-cmp" },
    opts = function(_, opts)
      -- Insert Copilot as the first completion source
      table.insert(opts.sources, 1, { name = "copilot" })
    end,
  },
}
