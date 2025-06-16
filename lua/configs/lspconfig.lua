require("nvchad.configs.lspconfig").defaults()

-- local servers = {
--     "html",
--     "cssls",
--     "clangd",
--     "ts_ls",
--     "bash-language-server",
--     "docker-compose-language-service",
--     "dockerfile-language-server"
-- }

-- Special handling for jdtls (Java)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local jdtls = require("jdtls")
    local home = vim.fn.expand("~")
    local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    local config = {
      cmd = {
        home .. "/.local/share/nvim/mason/packages/jdtls/bin/jdtls",
        "-data", workspace_dir,
      },
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
      on_attach = function(client, bufnr)
        -- Optional: Add keymaps or capabilities here
      end,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      settings = {
        java = {
          completion = {
            snippets = "none",
          },
        },
      },
      init_options = {
        bundles = {},
      },
    }

    jdtls.start_or_attach(config)
  end,
})

local signs = {
  ERROR = '',
  WARN = '',
  HINT = '󰌵',
  INFO = '',
}

vim.diagnostic.config({
  virtual_text = false,
  signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = signs.ERROR,
        [vim.diagnostic.severity.WARN] = signs.WARN,
        [vim.diagnostic.severity.HINT] = signs.HINT,
        [vim.diagnostic.severity.INFO] = signs.INFO,
      },
  },         -- Still show error/warning signs in the gutter
  underline = true,     -- Underline the problematic code
  float = {             -- Configuration for the automatic floating window
    -- IMPORTANT CHANGE HERE:
    focusable = false,  -- <<< Set this to false. This is the primary control.
    style = "minimal",  -- Minimal style for the float
    border = "double", -- Rounded border (or "single", "double", "none")
    -- You can also add a 'format' function here if you want to customize how messages look *inside* the float.
  },
})

-- read :h vim.lsp.config for changing options of lsp servers 
