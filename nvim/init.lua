require("config.lazy")
require("mapping")

-- colorScheme
local colors = {
    --backgrounds
    none           = "NONE",
    fg_dim         = "#a3cfc5",
    fg             = "#effffa",

    -- colors
    primary        = "#12e0b0",
    primary_dim    = "#0ba385",
    primary_bright = "#a6ffe9",
    complement     = "#e01242",
    yellow         = "#ffe66d",
    sky            = "#32c3ff",
    purple         = "#c6a8ff",
    comment        = "#94e3db",

    -- darks/lights
    black_dim      = "#1a2422",
    white          = "#d7efec",

    -- subtle tint
    tint           = "#0f201f",


}

local theme = {
    Normal       = { fg = colors.fg, bg = colors.none },
    NormalFloat  = { fg = colors.fg, bg = colors.black_dim },
    FloatBorder  = { fg = colors.primary, bg = colors.primary },
    -- CursorLine    = { bg = colors.none },
    -- CursorColumn  = { bg = colors.none },
    LineNr       = { bg = colors.black_dim },
    CursorLineNr = { fg = colors.black_dim, bg = colors.primary_bright },

    Pmenu        = { fg = colors.fg, bg = colors.black_dim },
    PmenuSel     = { fg = colors.white, bg = colors.primary },

    Search       = { fg = colors.white, bg = colors.primary },
    IncSearch    = { fg = colors.white, bg = colors.sky },

    Visual       = { bg = colors.tint },

    StatusLine   = { fg = colors.fg, bg = colors.tint },
    StatusLineNC = { fg = colors.fg_dim, bg = colors.tint },

    Comment      = { fg = colors.comment, italic = true },

    Identifier   = { fg = colors.primary },
    Statement    = { fg = colors.sky },
    Type         = { fg = colors.sky },
    Constant     = { fg = colors.purple },
    String       = { fg = colors.yellow },
    Function     = { fg = colors.primary_bright },
    Keyword      = { fg = colors.sky },
    Error        = { fg = colors.complement },
    WarningMsg   = { fg = colors.yellow },
    Todo         = { fg = colors.primary_dim, bg = colors.none },
}

-- applyThemes
for group, opts in pairs(theme) do
    vim.api.nvim_set_hl(0, group, opts)
end

-- basicSettings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- indentationSettings
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4

-- searchSettings
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.incsearch = true

-- visualSettings
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
-- vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.g.indentLine_enabled = 1

-- behaviorSettings
vim.opt.wildmode = "longest:full,full"
vim.opt.wildmenu = true
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.cmd("syntax on")
vim.opt.autochdir = false
vim.opt.backspace = "indent,eol,start"
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"

-- clipBoard
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy"
    },
    paste = {
        ["+"] = "wl-paste --no-newline",
        ["*"] = "wl-paste --no-newline"
    },
    cache_enabled = 0
}

-- fileHandling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.autoread = true
vim.opt.autowrite = false

-- !exist createUndoDirectory
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undo, "p")
end
