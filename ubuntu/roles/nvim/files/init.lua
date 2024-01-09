require("config.lazy")

-- PREFRENCES:-------------------------------------------------------------------------
vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 999
vim.opt.so = 999
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.cmd("filetype plugin indent on")

-- KEYBIDNINGS:----------------------------------------------------------------

-- SET CURSOR COLOR--------------------------------------------------------------------------------
-- To work with Gruvbox theme:
-- vim.cmd("highlight CursorLine guibg=#61afef")
-- vim.cmd("highlight CursorColumn guibg=#61afef")
-- vim.cmd("highlight Cursor guifg=#61afef guibg=#61afef")

-- To work with Solarized Dark Theme:
-- vim.cmd("highlight CursorLine guibg=#002b36")
-- vim.cmd("highlight CursorColumn guibg=#002b36")
-- vim.cmd("highlight Cursor guifg=#002b36 guibg=#002b36")

-- SET BACKGROUNDS TO BE TRANSPARENT:----------------------------------------------------------------
vim.cmd("highlight Normal guibg=none ctermbg=none")
vim.cmd("highlight NonText guibg=none ctermbg=none")
vim.cmd("highlight LineNr guibg=none ctermbg=none")
vim.cmd("highlight SignColumn guibg=none ctermbg=none")
vim.cmd("highlight EndOfBuffer guibg=none ctermbg=none")
vim.cmd("highlight NormalFloat guibg=none ctermbg=none")
vim.cmd("highlight NotifyBackground guibg=none ctermbg=none")
vim.cmd("highlight termguicolors guibg=none ctermbg=none")
vim.cmd("highlight Pmenu guibg=none ctermbg=none")
vim.cmd("highlight PmenuPreview guibg=none ctermbg=none")
vim.cmd("highlight PmenuSel guifg=#002b36")
vim.cmd("highlight LVCmdlineBorder guibg=none ctermbg=none")

-- Set NormalFloat to use a transparent background
vim.api.nvim_exec(
  [[
  augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight NormalFloat guibg=none
  augroup END
]],
  false
)

-- Define a background color for the NotifyBackground highlight group
-- vim.cmd("highlight NotifyBackground guibg=#252525")

-- Configure the notify plugin with the same background color
require("notify").setup({
  background_colour = "#252525",
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
-- vim.api.nvim_set_hl(0, "termguicolors", { bg = "none" })

--PRETTIER CONFIGURATION:----------------------------------------------------------------
-- vim.g.neoformat_prefer_global_config = 1
-- vim.g.neoformat_prettier_prettierrc = "$HOME/config/nvim/.prettierrc.json"

--GITHUB COPILOT:----------------------------------------------------------------
vim.api.nvim_set_keymap("i", "<C-S>", "v:lua.copilot_accept()", { expr = true })
vim.g.copilot_no_tab_map = true

function _G.copilot_accept()
  return vim.fn["copilot#Accept"]("\n")
end
