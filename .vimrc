"===================
"  Vim settings
"===================
"
"  ~ General
"  ~ Colorscheme
"  ~ Visual
"  ~ Indentation
"  ~ Search
"  ~ History
"  ~ Backups
"  ~ Abbreviations
"  ~ Functions
"  ~ Plugins
"  ~ Mappings
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

" Autoreload Vim settings
augroup reload_vimrc
  au!
  au BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set hidden    " Hide the buffers instead of closing them
set autoread  " Reload files that has been changed outside of Vim

"---------------
"  Colorscheme
"---------------

colorscheme solarized   " Solarized colorscheme
set background=dark     " Set background to dark
let g:solarized_menu=0  " Remove it's menu

"----------
"  Visual
"----------

" Window size and clipboard
if has("unix")               " Linux
  set lines=35                 " Height
  set columns=110              " Width
  set clipboard=unnamedplus    " Use + register for copy-paste
else                         " Windows
  set lines=45                 " Height
  set columns=130              " Width
  set clipboard=unnamed        " Use * register for copy-paste
endif

set number          " Show line numbering
set laststatus=2    " Always display the status line
set showcmd         " Show current command in the bottom right of the screen
set showmode        " Display the current mode
set ruler           " Show line, columns and percentage in status line
set colorcolumn=81  " Show a color column at the 81st column

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
set wildignore+=.git               " Version control
set wildignore+=.sass-cache        " Sass/SCSS
set wildignore+=*.jpg,*.png,*.svg  " Graphics
set wildignore+=*.min.*            " Minified versions

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
set virtualedit=block           " Enable visual block mode to go beyond the characters at the of a line

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
iabbrev cdate <C-R>=strftime("%d/%m/%Y")<cr>
iabbrev ctime <C-R>=strftime("%H:%M")<cr>

" Lorem ipsum
iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

"-------------
"  Functions
"-------------

" VExplorer (Netrw)
" (http://stackoverflow.com/questions/5006950/setting-netrw-like-nerdtree)
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction

" Pandoc Markdown Preview
function! PandocMarkdownPreview()
  " Set current working directory as root (for the current window only)
  silent exec 'lcd %:p:h'
  " Call Pandoc to do the conversion
  silent exec '!pandoc -o preview.html %'
  " Open the preview file in browser
  if has("win32") || has("win64")             " Windows
    silent exec '!start cmd /c preview.html'
  else                                        " Linux
    silent exec '!xdg-open preview.html'
  endif
  echo 'preview.html was generated.'
endfunction

"-----------
"  Plugins
"-----------

" ~ Netrw ~
let g:netrw_liststyle = 3     " Tree style listing
let g:netrw_browse_split = 4  " Open in previous window 
let g:netrw_altv = 1          " Split to right

" Hide wildignore files and folders
let g:netrw_list_hide = ".git,.sass-cache,*.jpg,*.png,*.svg"

" Windows size (percentage of the current window)
if has("unix")              " Linux
  let g:netrw_winsize = 20
else                        " Windows
  let g:netrw_winsize = 25
endif

" ~ CtrlP ~
let g:ctrlp_max_height = 8  " Max window size

" ~ Yankstack ~
call yankstack#setup()

" ~ Easy Session ~
if has("win32") || has("win64")
  let g:vim_sessions_dir = "D:/Git/Sessions"
else
  let g:vim_sessions_dir = "~/Git/Sessions"
endif

"------------
"  Mappings
"------------

" Easier window navigation
nnoremap <C-H> <C-W>h 
nnoremap <C-J> <C-W>j 
nnoremap <C-K> <C-W>k 
nnoremap <C-L> <C-W>l 

" Move by display lines rather than linewise
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Make Y behave like C and D
nnoremap Y y$

" Remove help toggling from F1
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" Map Space and Ctrl+Space to insert a new line above/below the current line
nnoremap <Space> O<Esc>
nnoremap <C-Space> o<Esc>

" Map Shift+Tab to unindent in insert mode
inoremap <S-Tab> <Esc><<I

" Map VExplorer (Netrw) to F1
nnoremap <F1> :call ToggleVExplorer()<cr>

" Map CtrlP's buffer list to F2
nnoremap <F2> :CtrlPBuffer<cr>

" Map Numbers to F3
nnoremap <F3> :NumbersToggle<cr>

" Map clear search highlighting to F4
nnoremap <F4> :nohls<cr>

" Map paste mode to F6
set pastetoggle=<F6>          " Enable pasting without indentation
au InsertLeave * set nopaste  " Disable paste mode when leaving insert mode

" Map Footnotes to F7
nnoremap <F7> :FootnotesToggle<cr>

" Map various code folding actions to F8
nnoremap <F8> za
vnoremap <F8> zf
inoremap <F8> <C-o>za

set timeoutlen=500  " Faster leader execution

" Set current file directory as root
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle whitespace
nnoremap <leader>w :set list!<cr>

" Trim trailing whitespace
nnoremap <leader>tw :%s/\s\+$//e<cr>

" Pandoc Markdown preview
nnoremap <leader>pmd :call PandocMarkdownPreview()<cr>
