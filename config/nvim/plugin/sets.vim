" ███████╗███████╗████████╗███████╗
" ██╔════╝██╔════╝╚══██╔══╝██╔════╝
" ███████╗█████╗     ██║   ███████╗
" ╚════██║██╔══╝     ██║   ╚════██║
" ███████║███████╗   ██║   ███████║
" ╚══════╝╚══════╝   ╚═╝   ╚══════╝

" 👉 indentation ==============================================================
set autoindent                 " New lines inherit the indentation of previous lines.
set expandtab                  " Convert tabs to spaces.
set shiftround                 " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=4               " When shifting, indent using four spaces.
set softtabstop=4              " How many columns (spaces) the cursors moves when pressing <Tab>.
set tabstop=4                  " Indent using four spaces.
set smarttab                   " Insert “tabstop” number of spaces when the <Tab> key is pressed.
" =============================================================================

" 🔍 search
" =============================================================================
set nohlsearch                 " Disable search highlighting.
set incsearch                  " Incremental search that shows partial matches.
set shortmess+=c               " Don't give ins-completion-menu messages.
" =============================================================================

" 📃 text =====================================================================
set display+=lastline          " Always try to show a paragraph’s last line.
set encoding=utf-8             " Use an encoding that supports unicode.
set nowrap                     " Disable line wrapping.
set linebreak                  " Avoid wrapping a line in the middle of a word.
set scrolloff=16               " The number of screen lines to keep above and below the cursor.
set spell spelllang=en_us      " Turn on spelling.
" =============================================================================

" 💃 performance ==============================================================
set complete-=i                " Limit the files searched for auto-completes.
set lazyredraw                 " Don’t update screen during macro and script execution.
" =============================================================================

" 👀 UI/UX ====================================================================
set laststatus=2               " Always display the status bar.
set showtabline=0              " Always hide tabline.
set wildmenu                   " Display command line’s tab complete options as a menu.
set wildmode=longest:full,full " Display
set number                     " Show line numbers on the sidebar.
set nu                         " Print the line number in front of each line.
set cul                        " Highlight the text line of the cursor with CursorLine.
set relativenumber             " Show line number on the current line and relative numbers on all other lines.
set noerrorbells               " Disable beep on errors.
set mouse=a                    " Enable mouse for scrolling and resizing.
set termguicolors              " Enables 24-bit RGB colors; requires an ISO-8613-3 compatible terminal.s
set signcolumn=yes             " Always enable sign column
set colorcolumn=80             " Color the sign column
set splitbelow                 " Split below by default
set noshowmode                 " If in Insert, Replace or Visual mode <do not> put a message on the last line.
set completeopt=menuone,noselect,noinsert " Inline text completion
" =============================================================================

" 🥷 miscellaneous ============================================================
set backspace=indent,eol,start " Allow backspacing over indention, line breaks and insertion start.
set nobackup                   " Disable backup files
set noswapfile                 " Disable swap files
set undofile                   " Enable undofile
set undodir=~/.vim/undodir     " Set undofile location
set formatoptions+=j           " Delete comment characters when joining lines.
set hidden                     " Hide files in the background instead of closing them.
set wildignore+=.pyc,.swp      " Ignore files matching these patterns when opening files based on a glob pattern.
set iskeyword +=-              " Include dash as word separator
" =============================================================================

" ██╗     ███████╗████████╗███████╗
" ██║     ██╔════╝╚══██╔══╝██╔════╝
" ██║     █████╗     ██║   ███████╗
" ██║     ██╔══╝     ██║   ╚════██║
" ███████╗███████╗   ██║   ███████║
" ╚══════╝╚══════╝   ╚═╝   ╚══════╝

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_tex_checkers = ['']
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "ﲅ"
let g:syntastic_style_error_symbol = "ﲅ"
let g:syntastic_warning_symbol = ""
let g:syntastic_style_warning_symbol = ""

let g:python3_host_prog="/usr/bin/python3"

let g:signify_sign_add               = ''
let g:signify_sign_delete            = ''
let g:signify_sign_delete_first_line = '⎴'
let g:signify_sign_change            = ''
let g:signify_sign_change_delete     = ''

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal='abdmgs'
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_conceal_frac=1

let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : '',
  \ 'callback' : 1,
  \ 'continuous' : 1,
  \ 'executable' : 'latexmk',
  \ 'hooks' : [],
  \ 'options' : [
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
\}

if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

" let g:slime_target = "tmux"
" let g:slime_paste_file = "$HOME/.slime_paste"
" let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
" let g:slime_python_ipython=1

let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   1,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }
