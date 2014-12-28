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

" Remove all GUI features
set guioptions=

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
