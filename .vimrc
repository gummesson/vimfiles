"===================
"  (g)Vim settings
"===================
"
"  + General
"  + Color Scheme
"  + Visual
"  + Indentation
"  + Search
"  + History
"  + Backups
"  + Abbreviations
"  + Plugins
"  + Keys
"
"===================

"-----------
"  General
"-----------

" Language 
if has("unix")
  language messages C
else
  language messages en
endif

set nocompatible          " No compatibility with Vi
call pathogen#infect()    " Enable the Pathogen plugin for easier plugin management
call pathogen#helptags()
syntax on                 " Enable syntax highighting
set encoding=utf-8        " Set encoding to UTF-8
filetype plugin on        " Detect filetype

" Remove sound and visual error
set noerrorbells visualbell t_vb=
au GUIEnter * set visualbell t_vb=

" Autoreload Vim settings
augroup reload_vimrc
  au!
  au BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set hidden     " Hide the buffers instead of closing them
set autowrite  " Write file while switching
set autoread   " Reload files that has been changed outside of Vim

"----------------
"  Color Scheme
"----------------

" Solarized
let g:solarized_menu=0  " Remove menu
colorscheme solarized   " Solarized theme
set background=dark     " Set dark background

"----------
"  Visual
"----------

" Font
if has("gui_running")
  if has("gui_gtk2")                          " Linux
    set guifont=Liberation\ Mono\ 10
  else                                        " Windows
    set guifont=Liberation_Mono:h10:cDEFAULT
  end
endif

" Window size and clipboard
if has("unix")               " Linux
  set lines=35                 " Height
  set columns=95               " Width
  set clipboard=unnamedplus    " Use + register for copy-paste
else                         " Windows
  set lines=45                 " Height
  set columns=130              " Width
  set clipboard=unnamed        " Use * register for copy-paste
endif

set guioptions-=T   " Hide toolbar
set number          " Show line numbering
set laststatus=2    " Display status line
set showcmd         " Show command in bottom right of the screen
set showmode        " Display the current mode
set ruler           " Show line, columns and percentage in status line
set colorcolumn=81  " Display color column at 81 characters

" Cursorline
au InsertEnter * set nocursorline  " Don't show the cursorline in insert mode...
au InsertLeave * set cursorline    " ...but show it in all the other modes.

set nowrap            " No word wrap
set scrolloff=5       " Start scrolling when the cursor is near the edges
set sidescrolloff=10
set sidescroll=1      " Scroll one character at a time
set showmatch         " Show matching parenthesis
set wildmenu          " Show options for file/command completion

" Wild ignores
set wildignore+=.git            " Version control
set wildignore+=.sass-cache     " Sass/SCSS
set wildignore+=.jpg,.png,.svg  " Graphics

" Mouse
set mouse=a    " Enable mouse usage
set mousehide  " Hide the mouse cursor while typing

" Code folding
set foldenable         " Enable code folding
set foldmethod=manual  " Use manual code folding

" Whitespace characters
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«
set showbreak=↪

" Windows
set splitbelow
set splitright
au VimResized * :wincmd =  " Autoresize windows

"---------------
"  Indentation
"---------------

filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation
set smarttab               " Insert tabs on the start of a line according to shiftwidth
set expandtab              " Replace tabs with spaces

" Set two spaces as default
set shiftwidth=2
set tabstop=2
set softtabstop=2

"----------
"  Search
"----------

set hlsearch    " Highlight search terms
set incsearch   " Show search matches as you type
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, case-sensitive otherwise

"-----------
"  History
"-----------

set history=1000     " Remember more commands and search history
set undolevels=1000  " Enable many, many undos

"-----------
"  Backups
"-----------

set nobackup    " No backups
set noswapfile  " No swap file

"-----------------
"  Abbreviations
"-----------------

" Date and time
abbrev idate <C-R>=strftime("%d/%m/%Y")<cr>
abbrev itime <C-R>=strftime("%H:%M")<cr>

" Lorem ipsum
abbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

" Footnotes (inline and reference)
abbrev fni <C-R>=strftime("[^%Y%m%d-]")<cr>
abbrev fnr <C-R>=strftime("[^%Y%m%d-]:")<cr>

"-----------
"  Plugins
"-----------

" NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 0  " Prevent from opening up on startup

" Set size
if has("unix")
  let g:NERDTreeWinSize = 25  " Linux
else
  let g:NERDTreeWinSize = 30  " Windows
endif

"--------
"  Keys
"--------
"
" F1: Toogle NERDTreeTabs
" F2: Toogle (relative) Numbers.vim
" F3: Toogle paste mode
" F4: Remove search highlightning
"
" \cd: Set current directory as root
" \hh: Toggle hexHighlighter
"  \w: Toggle whitespace
" \tw: Trim trailing whitspace
"

" Remove help toggling from F1
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

map <F1> :NERDTreeTabsToggle<cr>  " Map NERDTreeTabs to F1

map <F2> :NumbersToggle<cr>  " Map Numbers to F2

set pastetoggle=<F3>            " Enable pasting without indentation
au InsertLeave * set nopaste    " Diable paste mode when leaving insert mode
set backspace=indent,eol,start  " Enable backspacing over everything in insert mode

nnoremap <F4> :nohl<cr>         " Redraws the screen and removes any search highlighting

" Leader
map <leader>cd :cd %:p:h<cr>:pwd<cr>     " Set current file directory as root
map <leader>hh :call HexHighlight()<cr>  " Map hexHighlighter to hh
map <leader>w :set list!<cr>             " Toggle whitespace
map <leader>tw :%s/\s\+$//e<cr>          " Trim trailing whitespace

set timeoutlen=500  " Faster leader execution
