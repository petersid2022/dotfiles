vim.opt.guicursor = ""

-- Enable break indent
vim.opt.breakindent = true

vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Precede each line with its line number.
vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Do smart autoindenting when starting a new line.
vim.opt.smartindent = true

-- When on, lines longer than the width of the window will wrap
vim.opt.wrap = false

-- Set highlight on search
vim.opt.hlsearch = false

-- While typing a search command, show where the pattern
vim.opt.incsearch = true

-- Enables 24-bit RGB color in the |TUI|.
vim.opt.termguicolors = true

-- Minimal number of screen lines to keep 
-- above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

-- The minimal number of screen columns to keep to the left
vim.wo.sidescrolloff = 40

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- I use lualine for this
vim.opt.showmode = false

vim.opt.updatetime = 50
vim.opt.timeoutlen = 200

-- how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.langmap =
"ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"
