 -- ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
 -- ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

-- :help options
-- :help option-list

local options = {

-- 👉 indentation =============================================================
autoindent     = true,
expandtab      = true,
shiftround     = true,
smarttab       = true,
shiftwidth     = 4,
softtabstop    = 4,
tabstop        = 4,
-- ============================================================================

-- 🔍 search ==================================================================
hlsearch       = false,
incsearch      = true,
smartcase      = true,
-- ============================================================================

-- 📃 text ====================================================================
display        = { "lastline", "msgsep" },
wrap           = false,
linebreak      = true,
scrolloff      = 16,
sidescrolloff  = 6,
-- ============================================================================

-- 👀 UI ======================================================================
shortmess       = "filnxtToOFcs",
laststatus     = 2,
showtabline    = 0,
number         = true,
relativenumber = true,
cursorline     = true,
errorbells     = false,
termguicolors  = true,
signcolumn     = "yes",
colorcolumn    = "80",
-- ============================================================================

-- ⌨  UX ======================================================================
wildmenu       = true,
wildmode       = "longest:full,full",
mouse          = "a",
updatetime     = 250,
splitbelow     = true,
splitright     = true,
showmode       = false,
completeopt    = { "menuone", "noselect", "noinsert" },
formatoptions  = "tcrqj",
iskeyword      = "@,48-57,_,-,192-255",
-- ============================================================================

-- 🥷 miscellaneous ===========================================================
backup         = false,
swapfile       = false,
undofile       = true,
wildignore     = ".bak,~,.o,.h,.info,.swp,.obj,.pyc",
-- ============================================================================

}

vim.cmd [[ ]]

for k, v in pairs(options) do
    vim.opt[k] = v
end