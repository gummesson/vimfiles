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
" -- Filetypes
" -- Plugins
" -- Mappings
"
" }}}

" -- Vundle -------------------------------------------------------- {{{

" -- Setup --

set nocompatible
filetype plugin off
set runtimepath+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin()

" -- Plugins --

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reedes/vim-colors-pencil'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'b3niup/numbers.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'wellle/targets.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'justinmk/vim-sneak'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'tommcdo/vim-exchange'
Plugin 'tommcdo/vim-lion'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'sheerun/vim-polyglot'

" -- Teardown --

call vundle#end()

" }}}

" -- General ------------------------------------------------------- {{{

" Set language to english
set langmenu=none
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

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

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
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

set shortmess+=Iat  " Hide the intro and abbreviate and truncate command line messages
set number          " Show line numbering
set laststatus=2    " Always display the status line
set showcmd         " Show current command in the bottom right of the screen
set showmode        " Display the current mode
set textwidth=80    " The maximum line length (for reformatting)
set colorcolumn=+1  " Show the 81st column

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
  autocmd BufRead,BufNewFile *.{txt,md} set filetype=markdown
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
  autocmd InsertEnter * set nocursorline                   " Don't show the cursorline in insert mode...
  autocmd InsertLeave * set cursorline                     " ...but show it in all the other modes
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

" Trigger omnicompletion
inoremap <C-Space> <C-x><C-o>

" Toggle paste mode
set pastetoggle=<F2>

" Search two letters forward and backward with `Sneak`
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

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
