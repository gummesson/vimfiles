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
"  + Functions
"  + Plugins
"  + Keys
"
"===================

"-----------
"  General
"-----------

" Language
if has("unix")          " Linux
  language messages C
else                    " Windows
  language messages en
endif

set nocompatible          " No compatibility with Vi
call pathogen#infect()    " Enable the Pathogen plugin for easier plugin management
call pathogen#helptags()
syntax on                 " Enable syntax highighting
set encoding=utf-8        " UTF-8 encoding
filetype plugin on        " Detect filetype

" Remove sound and visual error
set noerrorbells visualbell t_vb=
au GUIEnter * set visualbell t_vb=

" Autoreload Vim settings
augroup reload_vimrc
  au!
  au BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set hidden    " Hide the buffers instead of closing them
set autoread  " Reload files that has been changed outside of Vim

"----------------
"  Color Scheme
"----------------

" Solarized
let g:solarized_menu=0  " Remove menu
colorscheme solarized   " Solarized theme
set background=dark     " Set background to dark

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

set guioptions-=T    " Hide the awful toolbar
set guioptions+=b,h  " Display a horizontal scrollbar
set number           " Show line numbering
set laststatus=2     " Always display the status line
set showcmd          " Show current command in the bottom right of the screen
set showmode         " Display the current mode
set ruler            " Show line, columns and percentage in status line
set colorcolumn=81   " Show a color column at the 81st column

" Cursorline
au InsertEnter * set nocursorline  " Don't show the cursorline in insert mode...
au InsertLeave * set cursorline    " ...but show it in all the other modes.

set nowrap            " No word wrap
set scrolloff=5       " Start scrolling when the cursor is near the edges
set sidescrolloff=10
set sidescroll=1      " Scroll one character at a time
set showmatch         " Show matching parenthesis
set matchtime=1       " Show matching paren a tenth of a second
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

set backspace=indent,eol,start  " Enable backspacing over everything in insert mode

" Windows
set splitbelow
set splitright
au VimResized * :wincmd =  " Autoresize windows

"---------------
"  Indentation
"---------------

" Set two spaces as default
set shiftwidth=2
set tabstop=2
set softtabstop=2

filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation
set smarttab               " Insert spaces on the start of a line (shiftwidth)
set expandtab              " Replace tabs with spaces
set shiftround             " Round indent to multiple of shiftwidth

"----------
"  Search
"----------

set hlsearch    " Highlight search terms
set incsearch   " Show search matches as they get typed
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, otherwise make it case-sensitive

"-----------
"  History
"-----------

set history=1000     " Remember more commands and a longer search history
set undolevels=1000  " Enable many, many, many, many, many undos

"-----------
"  Backups
"-----------

set nobackup    " No backups
set noswapfile  " No swap file

"-----------------
"  Abbreviations
"-----------------

" Date and time
iabbrev idate <C-R>=strftime("%Y/%m/%d")<cr>
iabbrev itime <C-R>=strftime("%H:%M")<cr>

" Lorem ipsum
iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

" Footnotes for Markdown (inline and reference)
iabbrev fni <C-R>=strftime("[^%Y%m%d-]")<cr>
iabbrev fnr <C-R>=strftime("[^%Y%m%d-]:")<cr>

"-------------
"  Functions
"-------------

" Render Markdown preview (via Pandoc)
function! PandocMarkdownPreview()
  silent exec 'cd %:p:h'
  silent exec 'pwd'
  silent exec '!pandoc -o preview.html %'
  if has("win32")                             " Windows
    silent exec '!start cmd /c preview.html'
  else                                        " Linux
    silent exec '!xdg-open preview.html'
  endif
endfunction

" Write mode
"
"  Changes the colorscheme and background, makes the font a bit bigger
"  and makes the window adjust.
"
function! WriteMode()
  colorscheme hemisu
  set background=light

if has("gui_running")
    if has("gui_gtk2")                          " Linux
      set guifont=Liberation\ Mono\ 14
      set lines=25
      set columns=70
    else                                        " Windows
      set guifont=Liberation_Mono:h14:cDEFAULT
      set lines=35
      set columns=100
    end
  endif
endfunction

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

" CtrlP
let g:ctrlp_max_height = 8  " Search window

"--------
"  Keys
"--------
"
" F1 - Toogle NERDTreeTabs
" F2 - Toogle (relative) Numbers.vim
" F3 - Toogle paste mode
" F4 - Remove search highlightning
"
" \cd  - Set current directory as root
"  \w  - Toggle whitespace
" \tw  - Trim trailing whitspace
" \pmd - Render Markdown preview
"

" Remove help toggling from F1
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

nnoremap <F1> :NERDTreeToggle<cr>  " Map NERDTree to F1

nnoremap <F2> :NumbersToggle<cr>  " Map Numbers to F2

set pastetoggle=<F3>          " Enable pasting without indentation
au InsertLeave * set nopaste  " Diable paste mode when leaving insert mode

nnoremap <F4> :nohl<cr>  " Redraw the screen and remove any search highlighting

set timeoutlen=500  " Faster leader execution

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>  " Set current file directory as root
nnoremap <leader>w :set list!<cr>          " Toggle whitespace
nnoremap <leader>tw :%s/\s\+$//e<cr>       " Trim trailing whitespace

" For writing
nnoremap <leader>pmd :call PandocMarkdownPreview()<cr>  " Render Markdown preview
nnoremap <leader>wm :call WriteMode()<cr>               " Switch to Write Mode
