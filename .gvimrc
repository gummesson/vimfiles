" -- .gvimrc ------------------------------------------------------- {{{
"
" -- General
" -- Interface
" -- Font
"
" }}}

" -- General  ------------------------------------------------------ {{{

" Remove sound and visual error
autocmd GUIEnter * set visualbell t_vb=

" }}}

" -- Interface ----------------------------------------------------- {{{

set guioptions-=m  " Hide the menu
set guioptions-=T  " Hide the toolbar
set guioptions-=r  " Hide the scrollbar

" Use a non blinking cursor
set guicursor=a:blinkon0

" Default window size
set lines=40
set columns=120

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Use a different colorscheme when in GUI mode
colorscheme gruvbox

" }}}

" -- Font ---------------------------------------------------------- {{{

if has('gui_gtk2')
  set guifont=Source\ Code\ Pro\ 11.5
else
  set guifont=Source\ Code\ Pro:h11
end

" Fix massive linespacing
set linespace=-1

" }}}

" vim:foldmethod=marker
