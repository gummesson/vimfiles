"===================
"  (g)Vim settings
"===================
"
"  + General
"  + Colors
"  + Visual
"  + Indentation
"  + Search
"  + History
"  + Backups
"  + Plugins
"  + Keys
"  
"===================

"-----------
"  General
"-----------

" Set language to english
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

"----------
"  Colors
"----------

" Solarized
let g:solarized_menu=0  " Remove menu
colorscheme solarized   " Solarized theme
set background=dark     " Set dark background

" Set color column
if exists("+colorcolumn")
  set colorcolumn=81
  "hi colorcolumn ctermbg=black guibg=black
endif

"----------
"  Visual
"----------

" Set font
if has("gui_running")
  if has("gui_gtk2")                          " Linux
    set guifont=Liberation\ Mono\ 10
  else                                        " Windows
    set guifont=Liberation_Mono:h10:cDEFAULT
  end
endif

if has("unix")               " Linux
  set lines=35               " Height
  set columns=95             " Width
  set clipboard=unnamedplus  " Use + register for copy-paste
else                         " Windows
  set lines=45               " Height
  set columns=130            " Width
  set clipboard=unnamed      " Use * register for copy-paste
endif

set guioptions-=T  " Hide toolbar
set number         " Show line numbering
set cursorline     " Highlight current line
set laststatus=2   " Display status line
set showcmd        " Show command in bottom right of the screen
set showmode       " Display the current mode
set ruler          " Show line, columns and percentage in status line

set nowrap            " No word wrap
set scrolloff=5       " Start scrolling when the cursor is near the edges
set sidescrolloff=10
set sidescroll=1      " Scroll one character at a time
set showmatch         " Show matching parenthesis
set wildmenu          " Show options for file/command completion

" Mouse
set mouse=a    " Enable mouse usage
set mousehide  " Hide the mouse cursor while typing

" Code folding
set foldenable         " Enable code folding
set foldmethod=manual  " Use manual code folding
                       " zf: Create fold
                       " za: Open fold
                       " zi: Toogle folding on/off
                       " zd: Remove fold

" Whitespace characters
set listchars=tab:—\ ,eol:¬

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

" YankRing
if has("win32")
   let g:yankring_history_dir = "$HOME/vimfiles"  " Set filepath for Windows
else
   let g:yankring_history_dir = "$HOME/.vim"      " Set filepath for Linux
endif

au VimLeave * :YRClear  " Clear history when exiting

"--------
"  Keys
"--------
"
" Ctrl+Space: Escape insert mode
"
" F1: Toogle NERDTreeTabs
" F2: Toogle (relative) Numbers.vim
" F3: Toogle paste mode
" F4: Remove search highlightning
"
" ,cd: Set current directory as root
" ,hh: Toggle hexHighlighter
"  ,w: Toggle whitespace
"
" j: Move down row by row
" k: Move up row by row
"
"  Shift+Left: Go to previous tab
" Shift+Right: Go to next tab
"
"    Ctrl+Up: Go to top window
"  Ctrl+Down: Go to bottom window
"  Ctrl+Left: Go to left window
" Ctrl+Right: Go to right window
"        ,eq: Make all windows equal in size
"

imap <C-Space> <Esc><Left>  " Map space to Esc (<Left> maintains cursor position in the middle of lines)

" Remove help toggling from F1
imap <F1> <nop>
nmap <F1> <nop>
vmap <F1> <nop>

map <F1> :NERDTreeTabsToggle<cr>  " Map NERDTreeTabs to F1
map <F2> :NumbersToggle<cr>       " Map Numbers to F4

set pastetoggle=<F3>            " Enable pasting without indentation
au InsertLeave * set nopaste    " Diable paste mode when leaving insert mode
set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
nmap <F4> :nohl<cr>             " Redraws the screen and removes any search highlighting

let mapleader = ","  " Map leader to ,
set timeoutlen=500   " Faster leader execution

" Leader keybindings
map <leader>cd :cd %:p:h<cr>:pwd<cr>     " Set current file directory as root
map <leader>hh :call HexHighlight()<cr>  " Map hexHighlighter to ,hh
map <leader>w :set list!<cr>             " Toggle whitespace

" Move row by row instead of line by line
nmap k gk  " Up
nmap j gj  " Down

" Tab navigation
map <S-Left> :tabprevious<cr>  " Shift+Left goes to previous tab
map <S-Right> :tabnext<cr>     " Shift+Right goes to next tab

" Window navigation
map <C-Up> <C-W>k     " Ctrl+Up goes to the top window
map <C-Down> <C-W>j   " Ctrl+Down goes to the bottom window
map <C-Left> <C-W>h   " Ctrl+Left goes to the left window
map <C-Right> <C-W>l  " Ctrl+Right goes to the right window

" Window size
map <leader>eq <C-W>=  " Make all windows equal in size

" Abbreviations and snippets
if has("win32")                              " Set filepath for Windows 
  source $HOME/vimfiles/config/abbrev.vim
  source $HOME/vimfiles/config/snippets.vim
else                                         " Set filepath for Linux
  source $HOME/.vim/config/abbrev.vim
  source $HOME/.vim/config/snippets.vim
endif