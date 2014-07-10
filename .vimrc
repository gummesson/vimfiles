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
" -- Miscellaneous
"
" }}}

" -- Vundle -------------------------------------------------------- {{{

" -- Setup --

set nocompatible
filetype plugin off
set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#begin()

" -- Plugins --

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'reedes/vim-colors-pencil'
Plugin 'itchyny/lightline.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-unimpaired'
Plugin 'wellle/targets.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tommcdo/vim-exchange'
Plugin 'tommcdo/vim-lion'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'mattn/emmet-vim'
Plugin 'ajh17/VimCompletesMe'
Plugin 'mbbill/undotree'
Plugin '1995eaton/vim-better-css-completion'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'sheerun/vim-polyglot'

" -- Teardown --

call vundle#end()

" }}}

" -- General ------------------------------------------------------- {{{

set langmenu=none                     " Set language to english
set t_Co=256                          " Enable 256 colors support
set lazyredraw                        " Don't redraw the screen while executing macros
set hidden                            " Hide the buffers instead of closing them
set autoread                          " Reload files that has been changed outside of Vim
set timeoutlen=750                    " Faster leader execution
set omnifunc=syntaxcomplete#Complete  " Use omnicompletion
set iskeyword+=-                      " Autocomplete keywords with dashes

syntax on           " Enable syntax highighting
filetype plugin on  " Detect filetype

" Remove sound and visual error
set noerrorbells visualbell t_vb=

" Format options
set formatoptions-=r  " Don't insert the current comment leader when hitting `Enter` in insert mode
set formatoptions-=o  " Don't insert the current comment leader when hitting `o` or `O` in insert mode
set formatoptions-=t  " Don't hard wrap lines

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set nobomb

" Use Unix-style line endings
set fileformat=unix

" Set clipboard
if has('unix')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" }}}

" -- Colorscheme --------------------------------------------------- {{{

colorscheme solarized  " Use `solarized`
set background=dark    " Set background to dark

" }}}

" -- Visual -------------------------------------------------------- {{{

set shortmess+=I    " Hide the intro message
set number          " Show line numbering
set laststatus=2    " Always display the status line
set showcmd         " Show current command in the bottom right of the screen
set showmode        " Display the current mode
set textwidth=80    " The maximum line length (for reformatting)
set colorcolumn=+1  " Show the 81st column

set nowrap            " No soft wrapping
set nostartofline     " Keep the cursor on the same column when moving around
set scrolloff=5       " Start scrolling when the cursor is near the edges
set sidescrolloff=10
set sidescroll=1      " Scroll one character at a time
set showmatch         " Show matching parens...
set matchtime=1       " ...for a tenth of a second
set wildmenu          " Show options for file and command completion

" Wild ignores
set wildignore+=.git,.sass-cache,tmp,*.min.*
set wildignore+=node_modules,bower_components
set wildignore+=*.jpg,*.png,*.svg,*.ico

" Mouse
set mouse=a    " Enable mouse usage
set mousehide  " Hide the mouse cursor while typing

" Folding
set foldenable         " Enable folding
set foldmethod=indent  " Fold by indentation
set foldlevelstart=99  " Start with open folds
set foldnestmax=9      " Only fold nine levels deep

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
set autoindent             " Enable auto indentation
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

set history=1000             " Remember more commands and searches
set undodir=$HOME/.vim/undo  " Set the undo directory
set undofile                 " Use persistent undo
set undolevels=1000          " Enable many undos

" }}}

" -- Backups ------------------------------------------------------- {{{

set nobackup    " No backups
set noswapfile  " No swap files

" }}}

" -- Abbreviations ------------------------------------------------- {{{

" Shebang!
iabbrev #! #!/usr/bin/env

" Fenced code blocks
iabbrev ~~ ~~~<cr><cr>~~~<Up><Up>

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

" Formatting for Markdown
function! MarkdownMode()
  setlocal wrap              " Wrap lines without adding line breaks
  setlocal linebreak
  setlocal textwidth=0
  setlocal wrapmargin=0
  setlocal formatoptions+=l
  setlocal colorcolumn=0     " Turn off visual cues
  setlocal nolist
  setlocal showbreak=
endfunction

" Trim trailing whitespace
function! TrimWhitespace()
  let hist = @/
  let line = line('.')
  let cols = col('.')
  silent! execute '%s/\s\+$//e | nohlsearch'
  call cursor(line, cols)
  let @/ = hist
endfunction

" Consistent line endings
function! UnixLineEndings()
  if &filetype == ''
    if &modifiable == '1'
      setlocal fileformat=unix
    endif
  endif
endfunction

" }}}

" -- Filetypes ----------------------------------------------------- {{{

" Markdown
augroup MarkdownSettings
  autocmd!
  autocmd BufRead,BufNewFile *{txt,md,markdown,mkdown,mkd} set filetype=markdown
  autocmd FileType markdown call MarkdownMode()
augroup END

" JSON
augroup JSONSettings
  autocmd!
  autocmd BufRead,BufNewFile *{jshintrc,bowerrc} set filetype=json
augroup END

" Vim
augroup VimSettings
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC  " Autoreload settings when saved
augroup END

" Global
augroup GlobalSettings
  autocmd!
  autocmd InsertEnter * set nocursorline       " Don't show the cursorline in insert mode...
  autocmd InsertLeave * set cursorline         " ...but show it in all the other modes
  autocmd BufWrite * call TrimWhitespace()
  if has('win32')
    autocmd BufEnter * call UnixLineEndings()
  endif
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

" -- Undotree --

let g:undotree_WindowLayout = 2

" -- Yankstack --

call yankstack#setup()

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

" Search two letters forward and backward with `Sneak`
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

" Redetect file
nnoremap <F5> :edit<cr>

" -- Leader --

" Set current directory as root
nnoremap <leader>r :cd %:p:h<cr>:pwd<cr>

" Open `netrw` as a project drawer
nnoremap <leader>v :Vexplore<cr>

" Open up `CtrlP`'s buffer list
nnoremap <leader>b :CtrlPBuffer<cr>

" Toggle between absolute and relative numbers with `Numbers`
nnoremap <leader>n :NumbersToggle<cr>

" Generate `ctags`
nnoremap <leader>c :silent! !ctags<cr>:redraw!<cr>

" Open `CtrlP`'s `ctags` list
nnoremap <leader>t :CtrlPTag<cr>

" Toggle `Undotree`
nnoremap <leader>u :UndotreeToggle

" -- Miscellaneous ------------------------------------------------- {{{

" Source additional/experimental settings
if filereadable($HOME.'/.vimrc.local')
  source $HOME/.vimrc.local
endif

" }}}

" vim:foldmethod=marker
