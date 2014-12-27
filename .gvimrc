" -- .gvimrc ------------------------------------------------------- {{{
"
" -- General
" -- Interface
" -- Font
"
" }}}

" -- General  ------------------------------------------------------ {{{

augroup GUI
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=  " Remove sound and visual error
augroup END

" }}}

" -- Interface ----------------------------------------------------- {{{

set guioptions-=m  " Hide the menu
set guioptions-=T  " Hide the toolbar
set guioptions-=r  " Hide the scrollbar

" Use a non blinking block cursor
set guicursor=a:block-blinkon0

" Set window size
set lines=40
set columns=120

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Use a different colorscheme when in GUI mode
colorscheme pencil

" }}}

" -- Font ---------------------------------------------------------- {{{

if has('unix')
  set guifont=Inconsolata\ 14
else
  set guifont=Inconsolata:h14
end

" }}}

" vim:foldmethod=marker
