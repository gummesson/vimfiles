" -- .vimrc -------------------------------------------------------- {{{
"
" -- Plugins
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
" -- Filetypes
" -- Plugins
" -- Mappings
"
" }}}

" -- Plugins ------------------------------------------------------- {{{

" -- Setup --

call plug#begin()

" -- Plugins --

Plug 'altercation/vim-colors-solarized'  " Terminal colorscheme
Plug 'reedes/vim-colors-pencil'          " Graphical colorscheme
Plug 'sheerun/vim-polyglot'              " Language pack
Plug 'itchyny/lightline.vim'             " Statusline enhancer
Plug 'kien/ctrlp.vim'                    " Fuzzy file and buffer finder
Plug 'b3niup/numbers.vim'                " Toggle between absolute and relative numbers
Plug 'ludovicchabant/vim-gutentags'      " Automatic tags generation
Plug 'gummesson/vim-grepany'             " Pattern searching
Plug 'wellle/targets.vim'                " Additional text objects
Plug 'vim-scripts/matchit.zip'           " Additional `%` targets
Plug 'justinmk/vim-sneak'                " Jump to any location specified by two characters
Plug 'tpope/vim-fugitive'                " Git wrapper
Plug 'tpope/vim-repeat'                  " Repeat plugin-defined mappings
Plug 'tpope/vim-unimpaired'              " Additional pairs of mappings
Plug 'tpope/vim-surround'                " Insert and change brackets, parens, quotes and tags
Plug 'tpope/vim-commentary'              " Comment and uncomment lines
Plug 'tpope/vim-abolish'                 " Case-insensitive abbreviations and substitutions
Plug 'tommcdo/vim-exchange'              " Exchange operator
Plug 'tommcdo/vim-lion'                  " Alignment operator
Plug 'tommcdo/vim-kangaroo'              " Maintain a manually-defined jump stack
Plug 'AndrewRadev/splitjoin.vim'         " Switch between multi-line and single-line statements
Plug 'AndrewRadev/sideways.vim'          " Move arguments
Plug 'ntpeters/vim-better-whitespace'    " Highlight and remove trailing whitespace
Plug 'jiangmiao/auto-pairs'              " Insert or delete brackets, parens, quotes in pairs
Plug 'mattn/emmet-vim'                   " Emmet abbreviations and expansions
Plug 'ervandew/supertab'                 " Automatic insert mode completions
Plug 'SirVer/ultisnips'                  " Snippets engine

" -- Teardown --

call plug#end()

" }}}

" -- General ------------------------------------------------------- {{{

syntax on                             " Enable syntax highighting
set t_Co=256                          " Enable 256 colors support
set lazyredraw                        " Don't redraw the screen while executing macros
set hidden                            " Hide the buffers instead of closing them
set autoread                          " Reload files that has been changed outside of Vim
set timeoutlen=750                    " Faster leader execution
set omnifunc=syntaxcomplete#Complete  " Use omnicompletion
set iskeyword+=-                      " Autocomplete keywords with dashes

" Remove sound and visual error
set noerrorbells
set visualbell
set t_vb=

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set nobomb

" Use Unix-style line endings
set fileformat=unix

" }}}

" -- Colorscheme --------------------------------------------------- {{{

colorscheme solarized  " Use `solarized`
set background=dark    " Set background to dark

" }}}

" -- Visual -------------------------------------------------------- {{{

set shortmess+=Iat  " Hide the intro and abbreviate and truncate command line messages
set number          " Show line numbering
set laststatus=2    " Always display the status line
set showcmd         " Show current command in the bottom right of the screen
set showmode        " Display the current mode
set textwidth=80    " The maximum line length (for reformatting)
set colorcolumn=+1  " Show the 81st column
set cursorline      " Show the cursorline

set nowrap                      " No soft wrapping
set nostartofline               " Keep the cursor on the same column when moving around
set scrolloff=5                 " Start scrolling when the cursor is near the edges
set sidescrolloff=10
set sidescroll=1                " Scroll one character at a time
set showmatch                   " Show matching parens...
set matchtime=1                 " ...for a tenth of a second
set wildmenu                    " Show options for file and command completion
set wildmode=longest:full,full  " Complete only up to the point of ambiguity
set wildignorecase              " Ignore case on files and diretories on the command line

" Wild ignores
set wildignore+=.git,.sass-cache,tmp,.bundle,*.min.*,tags
set wildignore+=node_modules,bower_components,vendor
set wildignore+=*.jpg,*.png,*.svg,*.ico,*.pdf,*.epub

" Mouse
set mouse=a    " Enable mouse usage
set mousehide  " Hide the mouse cursor while typing

" Folding
set foldenable         " Enable folding
set foldmethod=syntax  " Fold by indentation
set foldlevelstart=99  " Start with open folds
set foldnestmax=3      " Only fold three levels deep

" Whitespace characters
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«
set showbreak=↪

set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
set whichwrap=h,l,b,<,>,~,[,]   " Go to the previous/next line after reaching the first/last character in the line
set virtualedit=block           " Enable visual block mode to go beyond the characters at the of a line

" Windows and splits
set equalalways
set splitbelow
set splitright

" }}}

" -- Indentation --------------------------------------------------- {{{

set autoindent   " Enable auto indentation
set smartindent  " Enable context-sensitive indentation

" Set two spaces as default
set shiftwidth=2
set softtabstop=2

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

set nobackup    " No backups
set noswapfile  " No swap files

" }}}

" -- Language ------------------------------------------------------ {{{

set langmenu=none
set spelllang=en

" }}}

" -- System -------------------------------------------------------- {{{

" Set clipboard, `undodir` and `spellfile`
if has('unix')
  set clipboard=unnamedplus
  set undodir=$HOME/.vim/undo
  set spellfile=$HOME/.vim/spell/en.utf-8.add
else
  set clipboard=unnamed
  set undodir=$HOME/vimfiles/undo
  set spellfile=$HOME/vimfiles/spell/en.utf-8.add
endif

" }}}

" -- Abbreviations ------------------------------------------------- {{{

" Mistypes
cabbrev W w
cabbrev W! w!
cabbrev Q q
cabbrev Q! q!
cabbrev E e

" Write as `sudo`
cabbrev w!! w !sudo tee % >/dev/null

" }}}

" -- Filetypes ----------------------------------------------------- {{{

augroup MARKDOWN
  autocmd!
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
  autocmd FileType markdown setlocal formatoptions+=w1         " Use whitespace as a marker
  autocmd InsertEnter *.{txt,md} setlocal formatoptions+=a     " Automatically format paragraphs...
  autocmd InsertLeave *.{txt,md} setlocal formatoptions-=a     " ...but only in insert mode
augroup END

augroup VIM
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC  " Autoreload settings when saved
augroup END

augroup ALL
  autocmd!
  autocmd BufNewFile,BufRead * setlocal formatoptions-=ro  " Don't insert the current comment leader
  autocmd InsertEnter * setlocal nocursorline              " Don't show the cursorline in insert mode...
  autocmd InsertLeave * setlocal cursorline                " ...but show it in all the other modes
augroup END

" }}}

" -- Plugins ------------------------------------------------------- {{{

" -- Netrw --

let g:netrw_liststyle = 3            " Tree style listing
let g:netrw_browse_split = 4         " Open in previous window
let g:netrw_altv = 1                 " Split to right
let g:netrw_winsize = 20             " Window size (percentage of the current window)
let g:netrw_banner = 0               " Remove the information banner at the top
let g:netrw_list_hide = &wildignore  " Hide certain files and folders

" -- CtrlP --

let g:ctrlp_custom_ignore = 'public\|_site'  " Ignore directories with static files
let g:ctrlp_show_hidden = 1                  " Show hidden files

" -- Better Whitespace --

let g:strip_whitespace_on_save = 1  " Trim trailing whitespace on save

" -- Lightline --

let g:lightline = {
\ 'active': {
\   'left': [ ['mode'], ['filename', 'modified'], ['fugitive'] ]
\ },
\ 'component': {
\   'fugitive': '%{exists("*fugitive#head") ? fugitive#head() : ""}'
\ },
\ 'component_visible_condition': {
\   'fugitive': '(exists("*fugitive#head") && "" != fugitive#head())'
\ } }

" }}}

" -- Mappings ------------------------------------------------------ {{{

" -- Keys --

" Move by display lines rather than linewise
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Make `Y` behave like `C` and `D` (ie. to the end of line)
nnoremap Y y$

" Mark, select, join and reformat current paragraph
nnoremap Q mQvipJgvgq`Q

" Redetect file
nnoremap <F5> :edit<cr>

" Toggle folds
nnoremap <Space> za

" Easy buffer navigation
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Toggle paste mode
set pastetoggle=<F2>

" Search two letters forward and backward with `Sneak`
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

" Move arguments left or right with `Sideways`
nnoremap <C-h> :SidewaysLeft<cr>
nnoremap <C-l> :SidewaysRight<cr>

" -- Leader --

" Set current directory as root
nnoremap <leader>r :cd %:p:h<cr>:pwd<cr>

" Open `netrw` as a project drawer
nnoremap <leader>v :Vexplore<cr>

" Open up `CtrlP`'s buffer list
nnoremap <leader>b :CtrlPBuffer<cr>

" Toggle between absolute and relative numbers with `Numbers`
nnoremap <leader>n :NumbersToggle<cr>

" Open `CtrlP`'s `ctags` list
nnoremap <leader>t :CtrlPTag<cr>

" }}}

" vim:foldmethod=marker
