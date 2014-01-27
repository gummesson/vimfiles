" -- .gvimrc ------------------------------------------------------- {{{
"
" -- General
" -- Interface
" -- Font
" -- Colorscheme
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

" Window size
if has('unix')
  set lines=35
  set columns=110
else
  set lines=45
  set columns=130
endif

" }}}

" -- Font ---------------------------------------------------------- {{{

if has('gui_gtk2')
  set guifont=Liberation\ Mono\ 10
else
  set guifont=Liberation_Mono:h10:cDEFAULT
end

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Set Lightline theme
let g:lightline = { 'colorscheme': 'powerline' }

" Use `tomorrow-night-eighties` when in GUI mode
colorscheme Tomorrow-Night-Eighties

" }}}

" vim:foldmethod=marker
