"=================
"  gVim Settings
"=================
"
"  ~ General
"  ~ Interface
"  ~ Font
"  ~ Colorscheme
"  ~ Mappings
"
"=================

"-----------
"  General
"-----------

" Autoreload gVim settings
augroup reload_gvimrc
  au!
  au BufWritePost $MYGVIMRC source $MYGVIMRC
augroup END

" Remove sound and visual error
au GUIEnter * set visualbell t_vb=

"-------------
"  Interface
"-------------

set guioptions-=T  " Hide the toolbar

" Window size
if has("unix")     " Linux
  set lines=35       " Height
  set columns=110    " Width
  set guioptions-=m  " Hide the menu
  set guioptions-=r  " Hide the scrollbar
else               " Windows
  set lines=45       " Height
  set columns=130    " Width
endif

"--------
"  Font
"--------

if has("gui_gtk2")                          " Linux
  set guifont=Liberation\ Mono\ 10
else                                        " Windows
  set guifont=Liberation_Mono:h10:cDEFAULT
end

"---------------
"  Colorscheme
"---------------

" Set Lightline theme
let g:lightline = { 'colorscheme': 'powerline' }

" Use Tomorrow Night Eighties when in GUI mode
colorscheme Tomorrow-Night-Eighties

"------------
"  Mappings
"------------

" Map Ctrl+S to :update (for LiveReloading)
nnoremap <C-s> :update<cr>
inoremap <C-s> <C-o>:update<cr>
