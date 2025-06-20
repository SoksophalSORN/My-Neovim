require "nvchad.options"

-- add yours here!
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2        -- number of spaces a <Tab> displays as
vim.opt.shiftwidth = 2     -- number of spaces to use for autoindent
vim.opt.expandtab = true   -- use spaces instead of tabs

local o = vim.o -- Shorthand for vim.o

-- General UI and Behavior
o.compatible = false -- Disable compatibility with vi
o.encoding = "utf-8" -- Use UTF-8 encoding scheme
o.exrc = true      -- Allow local .nvim.lua or .nvimrc
o.secure = true    -- Restrict unsafe commands for safety
o.number = true             -- Add numbers to each line on the left-hand side.
o.cursorline = true         -- Highlight cursor line horizontally.
-- o.cursorcolumn = true    -- Highlight cursor line vertically. (Commented out in original)
o.scrolloff = 10            -- Do not let cursor scroll below or above N number of lines when scrolling.
o.wrap = false              -- Do not wrap lines. Allow long lines to extend.
o.showcmd = true            -- Show partial command you type in the last line.
o.showmode = true           -- Show the mode you are on the last line.
o.showmatch = true          -- Show matching words during a search.
o.hlsearch = true           -- Use highlighting when doing a search.
o.history = 1000            -- Set the commands to save in history.
o.mouse = "a"               -- Enable Mouse to navigate Vim.
o.updatetime = 1000         -- Time in milliseconds for CursorHold/InsertLeave events.
o.wildmenu = true           -- Enable auto completion menu after pressing TAB.
o.wildmode = "list:longest" -- Make wildmenu behave similar to Bash completion.
o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx" -- Files to ignore.
o.termguicolors = true      -- Fix Tmux coloring in Vim if it has termguicolors.
o.laststatus = 2            -- Enabling lightline (always show status line).
o.background = "dark"       -- Using lightline Dark solarized theme.
o.tags = "./tag,tag;"       -- Ensure Vim is set to read the tags file.
o.showmode = false          -- Disabling the original status line (Lightline will handle this).

-- Indentation and Tabs
o.shiftwidth = 4            -- Set shift width to 2 spaces.
o.tabstop = 4               -- Set tab width to 2 columns.
o.expandtab = true          -- Use space characters instead of tabs.

-- File Management
o.backup = false            -- Do not save backup files.

-- Searching
o.incsearch = true          -- Incrementally highlight matching characters as you type.
o.ignorecase = true         -- Ignore capital letters during search.
o.smartcase = true          -- Override the ignorecase option if searching for capital letters.

-- o.autoread = true          -- Automatically read files that have been changed outside of Vim.
-- o.autowrite = true         -- Automatically write changes to files before running external commands.

-- Clipboard configuration
-- 'unnamedplus' makes the '+' register (system clipboard) the default register
-- for yank (y), delete (d), put (p), etc.
-- Neovim will automatically use wl-copy/wl-paste if detected in PATH
o.clipboard = "unnamedplus"
-- Enable filetype detection, plugins, and indent
vim.cmd("filetype plugin indent on")

-- Turn syntax highlighting off
vim.cmd("syntax on")
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
