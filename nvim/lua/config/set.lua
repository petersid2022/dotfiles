-- Save undo history
vim.opt.undofile = true

if vim.env.SSH_TTY then
    -- only set clipboard if in ssh
    vim.opt.clipboard = "unnamedplus"
end

-- Confirm to save changes before exiting modified buffer
vim.opt.confirm = true

vim.opt.smoothscroll = true

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Precede each line with its line number.
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Set highlight on search
vim.opt.hlsearch = false

-- When on, lines longer than the width of the window will wrap
vim.opt.wrap = false

-- While typing a search command, show where the pattern
vim.opt.incsearch = true

-- Enables 24-bit RGB color.
vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- vim.opt.signcolumn = "number"
vim.opt.signcolumn = "yes"

-- The minimal number of screen columns to keep to the left
vim.wo.sidescrolloff = 40

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

-- I use mini.statusline for this
vim.opt.showmode = false

-- Global statusline
vim.opt.laststatus = 3

vim.opt.langmap =
"ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"
