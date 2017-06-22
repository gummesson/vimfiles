" -- .vimrc -------------------------------------------------------- {{{
"
" -- vim-plug
" -- General
" -- Colorscheme
" -- Visual
" -- Indentation
" -- Search
" -- History
" -- Backups
" -- Language
" -- System
" -- Groups
" -- Plugins
" -- Mappings
"
" }}}

" -- vim-plug ------------------------------------------------------ {{{

" -- Setup --

call plug#begin()

" -- Plugins --

Plug 'chriskempson/base16-vim'                                             " Colorschemes
Plug 'reedes/vim-colors-pencil'
Plug 'sheerun/vim-polyglot'                                                " Language packs
Plug 'ctrlpvim/ctrlp.vim'                                                  " Fuzzy finder
Plug 'ludovicchabant/vim-gutentags'                                        " Automatic tags generation
Plug 'editorconfig/editorconfig-vim'                                       " EditorConfig
Plug 'w0rp/ale'                                                            " Asynchronous lint engine
Plug 'junegunn/vim-peekaboo'                                               " Preview the contents of registers
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }                                 " Distraction-free writing
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }                       " Hyper-focused writing
Plug 'junegunn/gv.vim', { 'on': 'GV' }                                     " Git commit browser
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                         " Browse the undo tree
Plug 'reedes/vim-litecorrect'                                              " Lightweight auto-correction
Plug 'reedes/vim-wordy', { 'on': 'NextWordy' }                             " Uncover usage problems in writing
Plug 'dbmrq/vim-ditto'                                                     " Highlight overused words
Plug 'lukaszkorecki/workflowish'                                           " Workflowy clone
Plug 'vim-utils/vim-husk'                                                  " Readline keybindings for command-line mode
Plug 'wellle/targets.vim'                                                  " Additional text objects
Plug 'vim-scripts/matchit.zip', { 'for': ['html', 'ruby', 'vim'] }         " Additional `%` targets
Plug 'vim-scripts/ReplaceWithRegister'                                     " Replace text with motions
Plug 'justinmk/vim-sneak'                                                  " Jump to any location specified by two characters
Plug 'tpope/vim-fugitive'                                                  " Git wrapper
Plug 'tpope/vim-repeat'                                                    " Repeat plugin-defined mappings
Plug 'tpope/vim-unimpaired'                                                " Additional pairs of mappings
Plug 'tpope/vim-surround'                                                  " Insert and change brackets, parens, quotes and tags
Plug 'tpope/vim-commentary'                                                " Comment and uncomment lines
Plug 'tpope/vim-abolish'                                                   " Case-insensitive abbreviations and substitutions
Plug 'tpope/vim-eunuch'                                                    " UNIX (and Git Bash) helpers
Plug 'tpope/vim-vinegar'                                                   " Enhance `netrw`
Plug 'tommcdo/vim-lister'                                                  " Manipulate the argument, buffer, location and quickfix list
Plug 'tommcdo/vim-exchange'                                                " Exchange operator
Plug 'tommcdo/vim-lion'                                                    " Alignment operator
Plug 'AndrewRadev/splitjoin.vim'                                           " Switch between multi-line and single-line statements
Plug 'Raimondi/delimitMate'                                                " Insert or delete brackets, parens and quotes in pairs
Plug 'ajh17/VimCompletesMe'                                                " Tab-completion
Plug 'SirVer/ultisnips'                                                    " Snippets engine
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'sass', 'markdown'] }     " Emmet abbreviations and expansions
Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }  " JavaScript omni-completion

" -- Teardown --

call plug#end()

" }}}

" -- General ------------------------------------------------------- {{{

set t_Co=256        " Enable 256 colors
set lazyredraw      " Don't redraw during macros
set synmaxcol=300   " Only highlight the first 300 columns in the buffer
set hidden          " Hide buffers instead of closing them
set autoread        " Reload files that has been changed outside of Vim
set timeoutlen=750  " Faster leader execution

" Enable filetype plugins and indentation
filetype plugin indent on

" Remove sound and visual error
set noerrorbells
set visualbell
set t_vb=

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set nobomb

" Use Unix-style line endings
set fileformat=unix
set fileformats=unix,dos,mac

" Use forward slashes in paths
set shellslash

" Eanble local `.vimrc` files
set exrc
set secure

" }}}

" -- Colorscheme --------------------------------------------------- {{{

syntax on
let base16colorspace=256
colorscheme base16-ocean
set background=dark
set t_ut=

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
set scrolloff=1                 " Start scrolling when the cursor is near the edges
set sidescroll=1                " Scroll one character at a time...
set sidescrolloff=2             " ...even when `list` is set
set showmatch                   " Show matching parens...
set matchtime=1                 " ...for a tenth of a second
set wildmenu                    " Show options for file and command completion
set wildmode=longest:full,full  " Complete only up to the point of ambiguity
set wildignorecase              " Ignore case on files and directories on the command line

" Wild ignores
set wildignore+=*/.bundle/*,*/.gems/*,*/.sass-cache/*,*/db/*,*/elm-stuff/*,*/node_modules/*,*/tmp/*,*/vendor/*
set wildignore+=*/_site/*,*/build/*,*/coverage/*,*/dist/*,*/public/*,*/www/*
set wildignore+=*.log,*.jpg,*.png,*.svg,*.pdf,*.epub

" Completion
set complete-=i,t
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

" File navigation and completion
set path+=**
set suffixesadd+=.js,.css,.md,.txt

" Mouse
set mouse=a    " Enable mouse usage
set mousehide  " Hide the mouse cursor while typing

" Folding
set foldenable         " Enable folding
set foldmethod=indent  " Fold by indentation
set foldlevelstart=99  " Start with open folds
set foldnestmax=9      " Only fold nine levels deep
set foldopen-=block    " Don't open folds on `(`, `{` etc.

" Whitespace characters
set list
set listchars=tab:›\ ,trail:·,extends:»,precedes:«
set showbreak=

set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
set whichwrap+=h,l,<,>,~,[,]    " Go to the previous/next line after reaching the first/last character in the line
set virtualedit=block           " Enable visual block mode to go beyond the characters at the of a line
set formatoptions+=j            " Remove comment character when joining lines
set nrformats-=octal            " Disable octal increments and decrements
set nojoinspaces                " Don't insert two spaces after `.` when using `J`

" Windows and splits
set equalalways       " Make windows the same size after splitting or closing a window
set splitbelow        " Put a split beneath the current one
set splitright        " Put a split to the right the current one
set fillchars=vert:\  " Remove `|` from vertical splits

" Sessions
set sessionoptions-=blank    " Don't save empty buffers...
set sessionoptions-=options  " ...or mappings and other options

" -- Statusline --

set statusline=\ %f                                                  " Relative filename
set statusline+=\ %{fugitive#statusline()}                           " Fugitive status
set statusline+=%m%r%=                                               " Modified flag, read-only flag and separator
set statusline+=\ %{strlen(&filetype)?&filetype:'none'}              " Filetype
set statusline+=\ [%{ALEGetStatusLine()}\]                           " ALE status
set statusline+=\ \|\ %{strlen(&fileencoding)?&fileencoding:'none'}  " File encoding
set statusline+=\ \|\ %{strlen(&fileformat)?&fileformat:'none'}\     " file format

" }}}

" -- Indentation --------------------------------------------------- {{{

" Set two spaces as default
set shiftwidth=2
set softtabstop=2

set autoindent   " Enable auto indentation
set smartindent  " Enable context-sensitive indentation

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

set noswapfile     " No swap files
set nobackup       " No backups
set nowritebackup

" }}}

" -- Language ------------------------------------------------------ {{{

set spelllang=en,sv
set spellcapcheck=   " Don't check for capital letters at start of sentence

" }}}

" -- System -------------------------------------------------------- {{{

if has('unix')
  set undodir=$HOME/.vim/undo
  set spellfile=$HOME/.vim/spell/custom.utf-8.add
else
  set undodir=$HOME/vimfiles/undo
  set spellfile=$HOME/vimfiles/spell/custom.utf-8.add
endif

if executable('sift')
  set grepprg=sift\ --no-group\ --no-color
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" }}}

" -- Groups -------------------------------------------------------- {{{

augroup USER
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd User GoyoLeave Limelight!
augroup END

" }}}

" -- Plugins ------------------------------------------------------- {{{

" -- CtrlP --

if executable('sift')
  let g:ctrlp_user_command = 'sift --no-conf --ignore-case --no-color --no-group --git --targets --path "" %s'
endif

" -- EditorConfig --

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" -- ALE --

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" -- Peekabo --

let g:peekaboo_delay = 750

" -- Limelight --

let g:limelight_conceal_ctermfg = 'darkgray'

" -- Undotree --

let g:undotree_WindowLayout = 2

" -- Sneak --

let g:sneak#label = 1

" -- delimitMate --

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" -- UltiSnips --

let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" }}}

" -- Mappings ------------------------------------------------------ {{{

" -- Abbreviations --

iabbrev :date: <C-r>=strftime("%Y-%m-%d")<CR>
iabbrev :time: <C-r>=strftime("%H:%M:%S")<CR>

" -- Commands --

" Helper for `grep`
command! -bang -nargs=* -complete=file -bar Grep silent! grep! <args>

" -- Keys --

" Move by display lines rather than linewise
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Make `Y` behave like `C` and `D` (to the end of line)
nnoremap Y y$

" Reformat current paragraph
nnoremap Q gwip
vnoremap Q gw

" Jump between current and previously edited file
nnoremap <BS> <C-^>

" Toggle paste mode
set pastetoggle=<F2>

" Redetect file
nnoremap <F5> :e<CR>

" Toggle `Goyo`
nnoremap <F12> :Goyo<CR>

" -- Leader --

" Toggle search highlighting
nnoremap <leader><leader> :set nohlsearch!<CR>

" Run `CtrlPBuffer`
nnoremap <leader>b :CtrlPBuffer<CR>

" Show information about current cursor position
nnoremap <leader>c g<C-g>

" Explore current directory
nnoremap <leader>e :Explore<CR>

" Search for the current word under the cursor
nnoremap <leader>g :Grep! <cword><CR>

" Open help in new tab
nnoremap <leader>h :tab h<Space>

" ALE navigation
nnoremap <leader>j :ALEPreviousWrap<CR>
nnoremap <leader>k :ALENextWrap<CR>

" Cycle between windows
nnoremap <leader>n <C-w><C-w>

" Set current directory as root
nnoremap <leader>r :cd %:p:h<CR>:pwd<CR>

" Run `CtrlPTag`
nnoremap <leader>t :CtrlPTag<CR>

" Yank whole buffer (to clipboard)
nnoremap <leader>y :%y+<CR>

" Highlight and count the current word under the cursor
nnoremap <leader>w :set hlsearch<CR>*N:%s///gn<CR>

" }}}

" vim:foldmethod=marker
