" -- .gvimrc ------------------------------------------------------- {{{
"
" -- Interface
" -- Colorscheme
" -- Font
" -- Groups
"
" }}}


" -- Interface ----------------------------------------------------- {{{

set guioptions=c                " Remove all GUI features
set guicursor=a:block-blinkon0  " Use a non blinking block cursor

" Set window size
set lines=40
set columns=120

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Use curled underlines for spelling highlights
let g:pencil_gui_spell_undercurl = 1

" Use a different colorscheme when in GUI mode
colorscheme railscasts

" }}}

" -- Font ---------------------------------------------------------- {{{

if has('unix')
  set guifont=Inconsolata\ 14.5
else
  set guifont=Inconsolata:h14
end

" Remove extraneous line spacing
set linespace=0

" }}}

" -- Groups -------------------------------------------------------- {{{

augroup GUI
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=  " Remove sound and visual error
augroup END

" }}}

" vim:foldmethod=marker
