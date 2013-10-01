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

" Clipboard
if has("unix")               " Linux
  set clipboard=unnamedplus    " Use + register for copy-paste
else                         " Windows
  set clipboard=unnamed        " Use * register for copy-paste
endif

set nocompatible          " No compatibility with Vi
set t_Co=256              " Enable 256 colors support
call pathogen#infect()    " Enable the Pathogen plugin for easier plugin management
call pathogen#helptags()
syntax on                 " Enable syntax highighting
filetype plugin on        " Detect filetype
set encoding=utf-8        " UTF-8 encoding
set fileencoding=utf-8
set nobomb

" Use Unix-style line endings
set fileformat=unix
autocmd BufEnter * if &filetype == "" | setlocal fileformat=unix | endif

" Remove sound and visual error
set noerrorbells visualbell t_vb=

" Autoreload Vim settings
augroup reload_vimrc
  au!
  au BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set hidden    " Hide the buffers instead of closing them
set autoread  " Reload files that has been changed outside of Vim

" Omnicompletion
set omnifunc=syntaxcomplete#Complete

"---------------
"  Colorscheme
"---------------

" Set Lightline theme
let g:lightline = { 'colorscheme': 'solarized' }

colorscheme solarized   " Use Solarized colorscheme
set background=dark     " Set background to dark
let g:solarized_menu=0  " Remove the menu

"----------
"  Visual
"----------

set number          " Show line numbering
set laststatus=2    " Always display the status line
set showcmd         " Show current command in the bottom right of the screen
set showmode        " Display the current mode
set colorcolumn=81  " Show a color column at the 81st column

" Cursorline
au InsertEnter * set nocursorline  " Don't show the cursorline in insert mode...
au InsertLeave * set cursorline    " ...but show it in all the other modes

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
set wildignore+=node_modules       " Node.js
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
set whichwrap=h,l,b,<,>,~,[,]   " Go to the previous/next line after reaching the first/last character in the line
set virtualedit=block           " Enable visual block mode to go beyond the characters at the of a line

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
set expandtab              " Replace tabs with spaces
set smarttab               " Insert spaces on the start of a line (shiftwidth)
set shiftround             " Round the indent to the multiple of shiftwidth

" Set two spaces as default
set shiftwidth=2
set softtabstop=2

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
      silent! execute expl_win_num . 'wincmd w | close'
      silent! execute cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    silent! execute '1wincmd w | Vexplore'
    let t:expl_buf_num = bufnr("%")
  endif
endfunction

" Trim trailing whitespace
function! TrimWhitespace()
  let search_history = @/
  let line = line(".")
  let col = col(".")
    silent! execute '%s/\s\+$//e | nohlsearch'
  call cursor(line, col)
  let @/ = search_history
endfunction

" Shell execution function
function! ExecCmd(exec, cmd)
  if executable(a:exec)
    if has("win32") || has("win64")
      silent! execute '!start cmd /c '.a:exec.' '.a:cmd.' & pause'
    else
      silent! execute '!'.a:exec.' '.a:cmd
    endif
  endif
endfunction

" Go to project root
function! GoToRootDir()
  if isdirectory(".git") || filereadable(".git") || filereadable("index.html")
    pwd
  else
    silent! execute 'cd ../'
    call GoToRootDir()
  endif
endfunction

" Transform a string into a slug
function! Slug()
  " Whitespace and forward slashes
  silent! execute '%s/\v(\s+|\/)/-/g'
  " Punctuation and various other characters
  silent! execute '%s/\v(\.|\?|\!|\:|\#+|")//g'
  " Trailing dashes
  silent! execute '%s/\v(^\-+|\-+$)//g'
  " Transform to downcase
  silent! execute 'normal! guu'
endfunction

"-----------
"  Plugins
"-----------

" ~ Netrw ~
let g:netrw_liststyle = 3     " Tree style listing
let g:netrw_browse_split = 4  " Open in previous window
let g:netrw_altv = 1          " Split to right

" Hide wildignore files and folders
let g:netrw_list_hide = ".git,.sass-cache,*.jpg,*.png,*.svg,*.min.*,node_modules"

" Window size (percentage of the current window)
let g:netrw_winsize = 20

" ~ CtrlP ~
let g:ctrlp_max_height = 10  " Max window size

" ~ Yankstack ~
call yankstack#setup()

" ~ Indent Guides ~
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

"------------
"  Mappings
"------------

" Easier window navigation
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Bubble single lines
" (http://vimcasts.org/episodes/bubbling-text/)
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp

" Move by display lines rather than linewise
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Make Y behave like C and D
nnoremap Y y$

" Map Space and Ctrl+Space to insert a new line above/below the current line
nnoremap <Space> O<Esc>
nnoremap <C-Space> o<Esc>

" Map Omnicompletion to Ctrl+Tab
inoremap <C-Tab> <C-x><C-o>

" Remove help toggling from F1
inoremap <F1> <Nop>
nnoremap <F1> <Nop>
vnoremap <F1> <Nop>

" Map CtrlP's buffer list to F1
nnoremap <F1> :CtrlPBuffer<cr>

" Map VExplorer (Netrw) to F2
nnoremap <F2> :call ToggleVExplorer()<cr>

" Map paste mode to F3
set pastetoggle=<F3>          " Enable pasting without indentation
au InsertLeave * set nopaste  " Disable paste mode when leaving insert mode

" Map clear search highlighting to F4
nnoremap <F4> :nohlsearch<cr>

" Map Numbers to F5
nnoremap <F5> :NumbersToggle<cr>

" Faster leader execution
set timeoutlen=750

" Set current file directory as root
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle whitespace
nnoremap <leader>w :set list!<cr>

" Trim trailing whitespace
nnoremap <leader>tw :call TrimWhitespace()<cr>

" Toggle hexHighlight
nnoremap <leader>hh :call HexHighlight()<cr>

" Extended text objects
" (http://connermcd.com/blog/2012/10/01/extending-vim%27s-text-objects/)
let items = ["<bar>", "\\", "/", ":", ".", "*", "-", "_"]
for item in items
   silent! execute 'nnoremap yi'.item.' T'.item.'yt'.item
   silent! execute 'nnoremap ya'.item.' F'.item.'yf'.item
   silent! execute 'nnoremap ci'.item.' T'.item.'ct'.item
   silent! execute 'nnoremap ca'.item.' F'.item.'cf'.item
   silent! execute 'nnoremap di'.item.' T'.item.'dt'.item
   silent! execute 'nnoremap da'.item.' F'.item.'df'.item
   silent! execute 'nnoremap vi'.item.' T'.item.'vt'.item
   silent! execute 'nnoremap va'.item.' F'.item.'vf'.item
endfor

" Map GoToRootDir function
command! -nargs=0 Root call GoToRootDir()

" Map Slug function
command! -range -nargs=0 Slug call Slug()

" Map Git function
command! -nargs=? Git call ExecCmd("git", <q-args>)

" Map Grunt function
command! -nargs=? Grunt call ExecCmd("grunt", <q-args>)

" Map Chocolatey function
if has("win32") || has("win64")
  command! -nargs=? Chocolatey call ExecCmd("chocolatey", <q-args>)
endif
