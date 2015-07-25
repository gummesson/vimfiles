" -- .gvimrc ------------------------------------------------------- {{{
"
" -- Interface
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

" -- Font ---------------------------------------------------------- {{{

if has('unix')
  set guifont=Fira\ Mono\ 12
else
  set guifont=Fira_Mono:h12
end

" Fix font rendering
if has('win32') || has('win64')
  set renderoptions=type:directx,geom:1,renmode:5,taamode:1
endif

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
