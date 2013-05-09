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

set guioptions-=T  " Hide the awful toolbar
set guioptions+=b  " Display a horizontal scrollbar
set guioptions+=h

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

" Use Tomorrow Night Eighties when in GUI mode
colorscheme Tomorrow-Night-Eighties

"------------
"  Mappings
"------------

" Map Ctrl+S to :update (for LiveReloading)
nnoremap <C-s> :update<cr>
inoremap <C-s> <C-o>:update<cr>
