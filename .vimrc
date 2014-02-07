" -- .vimrc -------------------------------------------------------- {{{
"
" -- Vundle
" -- General
" -- Colorscheme
" -- Visual
" -- Indentation
" -- Search
" -- History
" -- Backups
" -- Abbreviations
" -- Functions
" -- Filetypes
" -- Plugins
" -- Mappings
"
" }}}

" -- Vundle -------------------------------------------------------- {{{

"  -- Setup --

set nocompatible
filetype plugin off
set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#rc()

" -- Bundles --

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'chriskempson/base16-vim'
Bundle 'sjl/badwolf'
Bundle 'gummesson/stereokai.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'mattn/emmet-vim'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'junegunn/vim-easy-align'
Bundle 'mileszs/ack.vim'
Bundle 'walm/jshint.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'gummesson/note.vim'
Bundle 'gummesson/footnotes.vim'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'
Bundle 'gorodinskiy/vim-coloresque'

" }}}

" -- General ------------------------------------------------------- {{{

" Set language and clipboard
if has('unix')
  language messages C
  set clipboard=unnamedplus
else
  language messages en
  set clipboard=unnamed
endif

set t_Co=256        " Enable 256 colors support
syntax on           " Enable syntax highighting
filetype plugin on  " Detect filetype

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set nobomb

" Use Unix-style line endings
set fileformat=unix

function! UnixLineEndings()
  if &filetype == ''
    if &modifiable == '1'
      setlocal fileformat=unix
    endif
  endif
endfunction

autocmd BufEnter * call UnixLineEndings()

" Remove sound and visual error
set noerrorbells visualbell t_vb=

" Autoreload Vim settings
augroup ReloadSettings
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set hidden    " Hide the buffers instead of closing them
set autoread  " Reload files that has been changed outside of Vim

" Use omnicompletion
set omnifunc=syntaxcomplete#Complete

set formatoptions-=r  " Don't insert the current comment leader when hitting `Enter` in insert mode
set formatoptions-=o  " Don't insert the current comment leader when hitting `o` or `O` in insert mode

" Faster leader execution
set timeoutlen=750

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Set `lightline` theme
let g:lightline = { 'colorscheme': 'solarized' }

colorscheme solarized   " Use `solarized`
set background=dark     " Set background to dark
let g:solarized_menu=0  " Remove the menu

" }}}

" -- Visual -------------------------------------------------------- {{{

set number          " Show line numbering
set laststatus=2    " Always display the status line
set showcmd         " Show current command in the bottom right of the screen
set showmode        " Display the current mode
set colorcolumn=81  " Show a color column at the 81st column

" Cursorline
augroup ToggleCursorLine
  autocmd!
  autocmd InsertEnter * set nocursorline  " Don't show the cursorline in insert mode...
  autocmd InsertLeave * set cursorline    " ...but show it in all the other modes
augroup END

set nowrap            " No word wrap
set scrolloff=5       " Start scrolling when the cursor is near the edges
set sidescrolloff=10
set sidescroll=1      " Scroll one character at a time
set showmatch         " Show matching parenthesis
set matchtime=1       " Show matching paren a tenth of a second
set wildmenu          " Show options for file and command completion

" Wild ignores
set wildignore+=.git,.sass-cache,tmp,*.min.*
set wildignore+=node_modules,bower_components
set wildignore+=*.jpg,*.png,*.svg,*.ico

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
autocmd VimResized * :wincmd =  " Autoresize windows

" }}}

" -- Indentation --------------------------------------------------- {{{

filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation
set expandtab              " Replace tabs with spaces
set smarttab               " Insert spaces on the start of a line (shiftwidth)
set shiftround             " Round the indent to the multiple of shiftwidth

" Set two spaces as default
set shiftwidth=2
set softtabstop=2

" }}}

" -- Search -------------------------------------------------------- {{{

set hlsearch    " Highlight search terms
set incsearch   " Show search matches as they get typed
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, otherwise make it case-sensitive

" }}}

" -- History ------------------------------------------------------- {{{

set history=1000     " Remember more commands and a longer search history
set undolevels=1000  " Enable many, many, many, many, many undos

" }}}

" -- Backups ------------------------------------------------------- {{{

set nobackup    " No backups
set noswapfile  " No swap files

" }}}

" -- Abbreviations ------------------------------------------------- {{{

" Shebang!
iabbrev #! #!/usr/bin/env

" }}}

" -- Functions ----------------------------------------------------- {{{

" Formatting for Markdown documents
function! MarkdownFormatting()
  setlocal wrap               " Word wrap without line breaks
  setlocal linebreak
  setlocal nolist
  setlocal textwidth=0
  setlocal wrapmargin=0
  setlocal formatoptions+=l
  setlocal colorcolumn=0     " Remove color column
  setlocal nocursorline      " Remove cursorline
  setlocal showbreak=        " Remove showbreak
endfunction

" Trim trailing whitespace
function! TrimWhitespace()
  let search_history = @/
  let line = line('.')
  let col = col('.')
    silent! execute '%s/\s\+$//e | nohlsearch'
  call cursor(line, col)
  let @/ = search_history
endfunction

" Go to project root
function! GoToRootDir()
  if isdirectory('.git') || filereadable('.git')
    pwd
  else
    silent! execute 'cd ../'
    call GoToRootDir()
  endif
endfunction

" }}}

" -- Filetypes ----------------------------------------------------- {{{

" Markdown
augroup MarkdownFiles
  autocmd!
  autocmd BufRead,BufNewFile *{txt,md,markdown,mkdown,mkd} set filetype=markdown
  autocmd FileType markdown call MarkdownFormatting()
  autocmd FileType markdown syntax match Comment /\%^---\_.\{-}---$/
augroup END

" }}}

" -- Plugins ------------------------------------------------------- {{{

" -- Netrw --

let g:netrw_liststyle = 3            " Tree style listing
let g:netrw_browse_split = 4         " Open in previous window
let g:netrw_altv = 1                 " Split to right
let g:netrw_winsize = 25             " Window size (percentage of the current window)
let g:netrw_banner=0                 " Remove the information banner at the top
let g:netrw_list_hide = &wildignore  " Hide certain files and folders

" -- CtrlP --

let g:ctrlp_max_height = 10                  " Maximum window size
let g:ctrlp_custom_ignore = 'public\|_site'  " Ignore directories with static files

" -- Yankstack --

call yankstack#setup()

" -- Note --

if has('unix')
  let g:notes_directory = '~/Dropbox/Dokument/Anteckningar/'
else
  let g:notes_directory = 'D:/Dropbox/Dokument/Anteckningar/'
endif

" }}}

" -- Mappings ------------------------------------------------------ {{{

" -- Keys --

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

" Make `Y` behave like `C` and `D`
nnoremap Y y$

" Remove help toggling from `F1`
nnoremap <F1> <Nop>
inoremap <F1> <Nop>
vnoremap <F1> <Nop>

" Map clear search highlighting to `Space`
nnoremap <Space> :nohlsearch<cr>

" Map Omnicompletion to `Ctrl+Space`
inoremap <C-Space> <C-x><C-o>

" Extended text objects
" (http://connermcd.com/blog/2012/10/01/extending-vim%27s-text-objects/)
let textobjects = ['<bar>', '\\', '/', ':', '.', '*', '-', '_']
for object in textobjects
   silent! execute 'nnoremap yi'.object.' T'.object.'yt'.object
   silent! execute 'nnoremap ya'.object.' F'.object.'yf'.object
   silent! execute 'nnoremap ci'.object.' T'.object.'ct'.object
   silent! execute 'nnoremap ca'.object.' F'.object.'cf'.object
   silent! execute 'nnoremap di'.object.' T'.object.'dt'.object
   silent! execute 'nnoremap da'.object.' F'.object.'df'.object
   silent! execute 'nnoremap vi'.object.' T'.object.'vt'.object
   silent! execute 'nnoremap va'.object.' F'.object.'vf'.object
endfor

" -- Leader --

" Set current directory as root
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Trim trailing whitespace
nnoremap <leader>w :call TrimWhitespace()<cr>

" Open Netrw as a project drawer
nnoremap <leader>v :Vexplore<cr>

" Toggle between absolute and relative numbers
nnoremap <leader>n :NumbersToggle<cr>

" -- Commands --

" Map `GoToRootDir` function
command! -nargs=0 Root call GoToRootDir()

" }}}

" vim:foldmethod=marker
