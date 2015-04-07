" -- .vimrc -------------------------------------------------------- {{{
"
" -- vim-plug
" -- General
" -- Colorscheme
" -- Visual
" -- Indentation
" -- Search
" -- History
" -- Backups
" -- Language
" -- System
" -- Abbreviations
" -- Groups
" -- Plugins
" -- Mappings
"
" }}}

" -- vim-plug ------------------------------------------------------ {{{

" -- Setup --

call plug#begin()

" -- Plugins --

Plug 'altercation/vim-colors-solarized'                      " Colorschemes
Plug 'reedes/vim-colors-pencil'
Plug 'whatyouhide/vim-gotham'
Plug 'ajh17/Spacegray.vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'                                  " Language packs
Plug 'ctrlpvim/ctrlp.vim'                                    " Fuzzy file, buffer, MRU and tag finder
Plug 'editorconfig/editorconfig-vim'                         " EditorConfig
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }      " Syntax checker
Plug 'justincampbell/vim-eighties', { 'on': 'Eighties' }     " Automatically resize windows
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }                   " Distraction-free writing
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }         " Hyper-focused writing
Plug 'reedes/vim-litecorrect', { 'for': 'markdown' }         " Lightweight auto-correction
Plug 'reedes/vim-wordy', { 'on': 'NextWordy' }               " Uncover usage problems in writing
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }           " Browse undo history
Plug 'ludovicchabant/vim-gutentags'                          " Automatic tags generation
Plug 'gummesson/vim-grepany', { 'on': ['Grep', 'LGrep'] }    " Pattern searching
Plug 'Peeja/vim-cdo', { 'on': ['Cdo', 'Ldo'] }               " Run a command over every entry in the quickfix or location list
Plug 'bruno-/vim-husk'                                       " Readline keybindings for command line mode
Plug 'wellle/targets.vim'                                    " Additional text objects
Plug 'vim-scripts/matchit.zip', { 'for': ['html', 'ruby'] }  " Additional `%` targets
Plug 'justinmk/vim-sneak'                                    " Jump to any location specified by two characters
Plug 'tpope/vim-fugitive'                                    " Git wrapper
Plug 'tpope/vim-repeat'                                      " Repeat plugin-defined mappings
Plug 'tpope/vim-unimpaired'                                  " Additional pairs of mappings
Plug 'tpope/vim-surround'                                    " Insert and change brackets, parens, quotes and tags
Plug 'tpope/vim-commentary'                                  " Comment and uncomment lines
Plug 'tpope/vim-abolish'                                     " Case-insensitive abbreviations and substitutions
Plug 'tpope/vim-eunuch'                                      " UNIX (and Git Bash) helpers
Plug 'tommcdo/vim-exchange'                                  " Exchange operator
Plug 'tommcdo/vim-lion'                                      " Alignment operator
Plug 'AndrewRadev/splitjoin.vim'                             " Switch between multi-line and single-line statements
Plug 'AndrewRadev/switch.vim'                                " Switch segments with predefined replacements
Plug 'jiangmiao/auto-pairs'                                  " Insert or delete brackets, parens and quotes in pairs
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }           " Emmet abbreviations and expansions
Plug 'ervandew/supertab'                                     " Automatic insert mode completions
Plug 'SirVer/ultisnips'                                      " Snippets engine

" -- Teardown --

call plug#end()

" }}}

" -- General ------------------------------------------------------- {{{

set t_Co=256                          " Enable 256 colors
set lazyredraw                        " Don't redraw during macros
set gdefault                          " Use global substitution by default
set synmaxcol=300                     " Only highlight the first 300 columns in the buffer
set hidden                            " Hide the buffers instead of closing them
set autoread                          " Reload files that has been changed outside of Vim
set timeoutlen=750                    " Faster leader execution
set omnifunc=syntaxcomplete#Complete  " Use omnicompletion

" Remove sound and visual error
set noerrorbells
set visualbell
set t_vb=

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set nobomb

" Use Unix-style line endings
set fileformat=unix
set fileformats=unix,dos,mac

" Eanble local `.vimrc` files
set exrc
set secure

" }}}

" -- Colorscheme --------------------------------------------------- {{{

colorscheme solarized  " Use `solarized`
set background=dark    " Set background to dark

" }}}

" -- Visual -------------------------------------------------------- {{{

set shortmess+=Iat  " Hide the intro and abbreviate and truncate command line messages
set number          " Show line numbering
set relativenumber  " use relative line numbering
set laststatus=2    " Always display the status line
set showcmd         " Show current command in the bottom right of the screen
set showmode        " Display the current mode
set textwidth=80    " The maximum line length (for reformatting)
set colorcolumn=+1  " Show the 81st column
set cursorline      " Show the cursorline

set nowrap                      " No soft wrapping
set nostartofline               " Keep the cursor on the same column when moving around
set scrolloff=3                 " Start scrolling when the cursor is near the edges
set sidescrolloff=5
set sidescroll=1                " Scroll one character at a time
set showmatch                   " Show matching parens...
set matchtime=1                 " ...for a tenth of a second
set wildmenu                    " Show options for file and command completion
set wildmode=longest:full,full  " Complete only up to the point of ambiguity
set wildignorecase              " Ignore case on files and directories on the command line

" Wild ignores
set wildignore+=.bundle,.gems,.git,.gs,.sass-cache,bower_components,node_modules,vendor
set wildignore+=_site,build,coverage,dist,public,tmp
set wildignore+=tags,*.log,*.min.*,*.jpg,*.png,*.svg,*.ico,*.pdf,*.epub

" Mouse
set mouse=a    " Enable mouse usage
set mousehide  " Hide the mouse cursor while typing

" Folding
set foldenable         " Enable folding
set foldmethod=syntax  " Fold by indentation
set foldlevelstart=99  " Start with open folds
set foldnestmax=3      " Only fold three levels deep
set foldopen-=block    " Don't open folds on `(`, `{` etc.

" Whitespace characters
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«
set showbreak=

set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
set whichwrap=h,l,b,<,>,~,[,]   " Go to the previous/next line after reaching the first/last character in the line
set virtualedit=block           " Enable visual block mode to go beyond the characters at the of a line
set formatoptions+=j            " Remove comment character when joining lines
set nrformats-=octal            " Disable octal increments and decrements
set nojoinspaces                " Don't insert two spaces after `.` when using `J`

set equalalways       " Make windows the same size after splitting or closing a window
set splitbelow        " Put a split beneath the current one
set splitright        " Put a split to the right the current one
set fillchars=vert:\  " Remove `|` from vertical splits

" -- Statusline --

set statusline=\ %f\                                                 " Relative filename
set statusline+=%m                                                   " Modified flag
set statusline+=%r                                                   " Read only flag
set statusline+=%{fugitive#statusline()}                             " Fugitive
set statusline+=%=                                                   " Separator
set statusline+=\ %{strlen(&filetype)?&filetype:'none'}              " Filetype
set statusline+=\ \|\ %{strlen(&fileencoding)?&fileencoding:'none'}  " File encoding
set statusline+=\ \|\ %{strlen(&fileformat)?&fileformat:'none'}      " file format
set statusline+=\ \|\ %c/%l/%L\                                      " Cursor and line position, and total lines

" }}}

" -- Indentation --------------------------------------------------- {{{

" Set two spaces as default
set shiftwidth=2
set softtabstop=2

set autoindent   " Enable auto indentation
set smartindent  " Enable context-sensitive indentation

set expandtab   " Replace tabs with spaces
set smarttab    " Insert spaces on the start of a line (shiftwidth)
set shiftround  " Round the indent to the multiple of shiftwidth

" }}}

" -- Search -------------------------------------------------------- {{{

set hlsearch    " Highlight search terms
set incsearch   " Show search matches as they get typed
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, otherwise make it case-sensitive

" }}}

" -- History ------------------------------------------------------- {{{

set history=1000     " Remember more commands and searches
set undofile         " Use persistent undo
set undolevels=1000  " Enable many undos

" }}}

" -- Backups ------------------------------------------------------- {{{

set noswapfile     " No swap files
set nobackup       " No backups
set nowritebackup

" }}}

" -- Language ------------------------------------------------------ {{{

set langmenu=none
set spelllang=en,sv

" }}}

" -- System -------------------------------------------------------- {{{

" Set clipboard, `undodir` and `spellfile`
if has('unix')
  set clipboard=unnamedplus
  set undodir=$HOME/.vim/undo
  set spellfile=$HOME/.vim/spell/custom.utf-8.add
else
  set shellslash
  set clipboard=unnamed
  set undodir=$HOME/vimfiles/undo
  set spellfile=$HOME/vimfiles/spell/custom.utf-8.add
endif

" }}}

" -- Abbreviations ------------------------------------------------- {{{

" -- Mistypes --

cabbrev W w
cabbrev W! w!
cabbrev Q q
cabbrev Q! q!

" }}}

" -- Groups -------------------------------------------------------- {{{

augroup MARKDOWN
  autocmd!
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
  autocmd FileType markdown call litecorrect#init()
  autocmd User GoyoLeave Limelight!
augroup END

augroup ALL
  autocmd!
  autocmd InsertEnter * setlocal nocursorline  " Don't show the cursorline in insert mode...
  autocmd InsertLeave * setlocal cursorline    " ...but show it in all the other modes
augroup END

" }}}

" -- Plugins ------------------------------------------------------- {{{

" -- Polyglot --

let g:markdown_folding = 1
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json', 'ruby']

" -- Limelight --

let g:limelight_conceal_ctermfg = 'darkgray'

" -- Syntastic --

" Disable automatic checking
let g:syntastic_mode_map = {
\ 'mode': 'passive',
\ 'active_filetypes': [],
\ 'passive_filetypes': [] }

" Use the location list
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = '!'

" Syntax checkers
let g:syntastic_javascript_checkers = ['eslint']

" -- Netrw --

let g:netrw_liststyle = 3            " Tree style listing
let g:netrw_browse_split = 4         " Open in previous window
let g:netrw_altv = 1                 " Split to right
let g:netrw_winsize = 20             " Window size (percentage of the current window)
let g:netrw_banner = 0               " Remove the information banner at the top
let g:netrw_list_hide = &wildignore  " Hide certain files and folders

" -- CtrlP --

let g:ctrlp_show_hidden = 1

" -- Undotree --

let g:undotree_WindowLayout = 2

" -- Supertab --

let g:SuperTabDefaultCompletionType = 'context'

" -- Auto Pairs --

let g:AutoPairsShortcutFastWrap = ''

" -- Mappings ------------------------------------------------------ {{{

" -- Keys --

" Move by display lines rather than linewise
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Make `Y` behave like `C` and `D` (ie. to the end of line)
nnoremap Y y$

" Reformat current paragraph
nnoremap Q gwip
vnoremap Q gw

" Toggle search highlighting
nnoremap <Space> :set nohlsearch!<cr>

" Enable `Wordy`
nnoremap § :NextWordy<cr>

" Toggle paste mode
set pastetoggle=<F2>

" Redetect file
nnoremap <F5> :edit<cr>

" Toggle `Goyo`
nnoremap <F12> :Goyo<cr>

" -- Leader --

" Set current directory as root
nnoremap <leader>r :cd %:p:h<cr>:pwd<cr>

" Open `netrw` as a project drawer
nnoremap <leader>v :Vexplore<cr>

" Open `CtrlP`'s buffer list
nnoremap <leader>b :CtrlPBuffer<cr>

" Open `CtrlP`'s `ctags` list
nnoremap <leader>t :CtrlPTag<cr>

" Toggle `Undotree`
nnoremap <leader>u :UndotreeToggle<cr>

" Run `SyntasticCheck`
nnoremap <leader>c :SyntasticCheck<cr>

" }}}

" vim:foldmethod=marker
