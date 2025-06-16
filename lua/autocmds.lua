require "nvchad.autocmds"

-- lua/config/autocmds.lua

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

local myAutoGroup = augroup("MyCustomAutocmds", { clear = true }) -- clear = true to prevent duplicate autocmds on config reload

-- Auto-save whenever I leave insert mode (original vimscript: autocmd CursorHold,InsertLeave * silent! w)
autocmd({"CursorHold", "InsertLeave"}, {
  group = myAutoGroup,
  pattern = "*",
  command = "silent! w",
  desc = "Auto save on idle or leaving insert mode",
})

-- C Template
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.c",
  command = "0r ~/.vim/templates/c_template.c",
  desc = "Load C template for new .c files",
})
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.c",
  command = "normal! 6G",
  desc = "Move cursor to line 6 for new .c files",
})
autocmd("FileType", {
  group = myAutoGroup,
  pattern = "c",
  callback = function()
    map("n", "<C-b>", ":!clear && gcc % -o Trish && ./Trish<CR>", {
      noremap = true, silent = true, buffer = true,
      desc = "Compile and run C file",
    })
  end,
  desc = "Map C-b for C filetype",
})

-- C++ Template
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.cpp",
  command = "0r ~/.vim/templates/cpp_template.cpp",
  desc = "Load C++ template for new .cpp files",
})
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.cpp",
  command = "normal! 4G",
  desc = "Move cursor to line 4 for new .cpp files",
})
autocmd("FileType", {
  group = myAutoGroup,
  pattern = "cpp",
  callback = function()
    map("n", "<C-b>", ":!clear && g++ % -o Nero && ./Nero<CR>", {
      noremap = true, silent = true, buffer = true,
      desc = "Compile and run C++ file",
    })
  end,
  desc = "Map C-b for C++ filetype",
})

-- Python Template
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.py",
  command = "0r ~/.vim/templates/python_template.py",
  desc = "Load Python template for new .py files",
})
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.py",
  command = "normal! 6G",
  desc = "Move cursor to line 6 for new .py files",
})
autocmd("FileType", {
  group = myAutoGroup,
  pattern = "python",
  command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab",
  desc = "Set Python tab size to 2",
})
autocmd("FileType", {
  group = myAutoGroup,
  pattern = "python",
  callback = function()
    map("n", "<C-b>", ":!clear && python3 %<CR>", {
      noremap = true, silent = true, buffer = true,
      desc = "Run Python file",
    })
  end,
  desc = "Map C-b for Python filetype",
})

-- Java Template
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.java",
  command = "0r ~/.vim/templates/java_template.java",
  desc = "Load Java template for new .java files",
})
autocmd("BufNewFile", {
  group = myAutoGroup,
  pattern = "*.java",
  -- Note: The original uses silent! %s/Filename/\=expand("%:t:r")/g which needs careful escaping.
  -- Lua string literal [[...]] is good for this.
  command = [[silent! %s/Filename/\=expand("%:t:r")/g]],
  desc = "Replace 'Filename' with actual file name in Java template",
})
autocmd("FileType", {
  group = myAutoGroup,
  pattern = "java",
  callback = function()
    -- Original: nnoremap <buffer> <C-b> :w<CR>:!clear && mkdir -p bin && javac -encoding UTF-8 -d bin $(find . -name "*.java" -not -path "./bin/*" -print 2>/dev/null) && java -cp bin <C-r>=substitute(substitute(expand('%:r'), '^src/', '', ''), '/', '.', 'g')<CR><CR>
    map("n", "<C-b>", [[<Cmd>w<CR>:!clear && mkdir -p bin && javac -encoding UTF-8 -d bin $(find . -name "*.java" -not -path "./bin/*" -print 2>/dev/null) && java -cp bin <C-r>=substitute(substitute(expand('%:r'), '^src/', '', ''), '/', '.', 'g')<CR><CR>]], {
      noremap = true, silent = true, buffer = true,
      desc = "Compile and run Java file",
    })
  end,
  desc = "Map C-b for Java filetype",
})

-- Automatically restores the cursor to its last saved position when a file is opened.
autocmd("BufReadPost", {
  -- Triggered after a buffer (file) has been read.
  callback = function()
    -- Get the last saved cursor mark (the '"' mark, saved by 'shada').
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    -- Get the total line count of the current buffer.
    local lcount = vim.api.nvim_buf_line_count(0)

    -- If the saved mark's line number is valid and exists within the buffer,
    -- move the cursor to that position. 'pcall' prevents errors if the mark is invalid.
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Set updatetime to a lower value for quicker CursorHold triggers
vim.o.updatetime = 250

-- Create an autocommand group to manage your custom autocommands
augroup("MyLspAutos", { clear = true })

-- Autocommand to open diagnostic float on cursor hold in normal and insert mode
autocmd({ "CursorHold", "CursorHoldI" }, {
  group = "MyLspAutos",
  callback = function()
    local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local diagnostics_on_line = vim.diagnostic.get(0, { lnum = current_line })

    if #diagnostics_on_line > 0 then
      vim.diagnostic.open_float(nil, {
        -- IMPORTANT CHANGE HERE:
        focusable = false, -- <<< Ensure this is false for automatic popups
        border = "double",
      })
    end
  end,
  desc = "Show LSP diagnostic float on cursor hold",
})

autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime"
})
