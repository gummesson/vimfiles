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

" -- Setup --

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
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'
Bundle 'jnwhiteh/vim-golang'

" }}}

" -- General ------------------------------------------------------- {{{

set langmenu=none                     " Set language to english
set t_Co=256                          " Enable 256 colors support
set lazyredraw                        " Don't redraw the screen while executing macros
set hidden                            " Hide the buffers instead of closing them
set autoread                          " Reload files that has been changed outside of Vim
set timeoutlen=750                    " Faster leader execution
set omnifunc=syntaxcomplete#Complete  " Use omnicompletion

syntax on           " Enable syntax highighting
filetype plugin on  " Detect filetype

" Format options
set formatoptions-=r  " Don't insert the current comment leader when hitting `Enter` in insert mode
set formatoptions-=o  " Don't insert the current comment leader when hitting `o` or `O` in insert mode

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set nobomb

" Remove sound and visual error
set noerrorbells visualbell t_vb=

" Use Unix-style line endings
set fileformat=unix

function! UnixLineEndings()
  if &filetype == ''
    if &modifiable == '1'
      setlocal fileformat=unix
    endif
  endif
endfunction

augroup LineEndings
  autocmd!
  autocmd BufEnter * call UnixLineEndings()
augroup END

" Set clipboard
if has('unix')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Autoreload Vim settings
augroup ReloadSettings
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Set `lightline` theme
let g:lightline = { 'colorscheme': 'solarized' }

colorscheme solarized   " Use `solarized`
set background=dark     " Set background to dark
let g:solarized_menu=0  " Remove the menu

" }}}

" -- Visual -------------------------------------------------------- {{{

set shortmess+=I    " Hide the intro message
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
set nostartofline     " Keep the cursor on the same column when moving around
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

" Windows and splits
set splitbelow
set splitright
autocmd VimResized * :wincmd =  " Autoresize windows

" }}}

" -- Indentation --------------------------------------------------- {{{

filetype plugin indent on  " Enable indentation
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation

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

" Mistypes
cabbrev W w
cabbrev W! w!
cabbrev Q q
cabbrev Q! q!
cabbrev E e

" Write as `sudo`
cabbrev sudo w !sudo tee % >/dev/null

" }}}

" -- Functions ----------------------------------------------------- {{{

" Formatting for Markdown documents
function! MarkdownFormatting()
  " Wrap long lines without adding line breaks
  setlocal wrap
  setlocal linebreak
  setlocal nolist
  setlocal textwidth=0
  setlocal wrapmargin=0
  setlocal formatoptions+=l
  " Hablo inglés, por favor
  setlocal spell
  setlocal spelllang=en_us
  " Remove `colorcolumn`, `cursorline` and `showbreak`
  setlocal colorcolumn=0
  setlocal nocursorline
  setlocal showbreak=
  " Syntax highlighting for Jekyll
  syntax match Comment /\v^(---)$(\_.*)^(---)$/
  syntax match PreProc /\v\{(\{|\%)(.*)(\%|\})\}/
  syntax match PreProc /\v\{:\s+(.*)\s+\}/
endfunction

" Trim trailing whitespace
function! TrimWhitespace()
  let hist = @/
  let line = line('.')
  let col  = col('.')
  silent! execute '%s/\s\+$//e | nohlsearch'
  call cursor(line, col)
  let @/ = hist
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
augroup END

" All
augroup AllFiles
  autocmd!
  autocmd BufWrite * call TrimWhitespace()
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

" Align (visually) selected text with `EasyAlign`
vmap <Enter> <Plug>(EasyAlign)

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

" Open `netrw` as a project drawer
nnoremap <leader>v :Vexplore<cr>

" Open up `CtrlP`'s buffer list
nnoremap <leader>b :CtrlPBuffer<cr>

" Toggle between absolute and relative numbers with `Numbers`
nnoremap <leader>n :NumbersToggle<cr>

" -- Commands --

" Map `GoToRootDir` function
command! -nargs=0 Root call GoToRootDir()

" }}}

" vim:foldmethod=marker
