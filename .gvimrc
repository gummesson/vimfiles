" -- .gvimrc ------------------------------------------------------- {{{
"
" -- General
" -- Interface
" -- Font
" -- Colorscheme
" -- Functions
" -- Mappings
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
if has('gui_gtk2')  " Linux (smaller screen)
  set lines=35
  set columns=110
else
  set lines=45
  set columns=130
endif

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Set `lightline` theme
let g:lightline = { 'colorscheme': 'powerline' }

" Use `badwolf` when in GUI mode
colorscheme badwolf

" }}}

" -- Font ---------------------------------------------------------- {{{

if has('gui_gtk2')                  " Linux
  set guifont=Liberation\ Mono\ 10
else
  set guifont=Liberation\ Mono:h10
end

" }}}

" -- Functions ----------------------------------------------------- {{{

" Use a larger font size but retain the window size
function! BigMode()
  if has('gui_gtk2')
    set guifont=Liberation\ Mono\ 10
    set lines=28
    set columns=88
  else
    set guifont=Liberation\ Mono:h13
    set lines=36
    set columns=104
  endif
endfunction

" }}}

" -- Mappings ------------------------------------------------------ {{{

" Map `BigMode`
command! -nargs=0 Bigger call BigMode()

" }}}

" vim:foldmethod=marker
