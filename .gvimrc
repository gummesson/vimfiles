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

" No blinking cursor
set guicursor=a:blinkon0

" Window size
set lines=40
set columns=120

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Set `lightline` theme
let g:lightline = { 'colorscheme': 'powerline' }

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
