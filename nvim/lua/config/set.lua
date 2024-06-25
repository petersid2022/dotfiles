-- Save undo history
vim.opt.undofile = true

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

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Enable mouse mode
vim.opt.mouse = "a"

-- Set highlight on search
vim.opt.hlsearch = false

-- When on, lines longer than the width of the window will wrap
vim.opt.wrap = false

-- While typing a search command, show where the pattern
vim.opt.incsearch = true

-- Enables 24-bit RGB color.
vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.signcolumn = "yes"

-- The minimal number of screen columns to keep to the left
vim.wo.sidescrolloff = 20

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.opt.updatetime = 200
vim.opt.timeoutlen = 400

vim.opt.conceallevel = 2

vim.opt.langmap =
  "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

vim.opt.breakindentopt = "list:-1"
