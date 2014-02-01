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
if has('unix')
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

if has('gui_gtk2')
  set guifont=Liberation\ Mono\ 10
else
  set guifont=Liberation_Mono:h10:cDEFAULT
end

" }}}

" -- Functions ----------------------------------------------------- {{{

" Set the font size in a more convenient way
function! SetFontSize(size)
  if has('win32') || has('win64')
    let name = split(&guifont, ':')[0]
    let font = name.':h'.a:size.':cDEFAULT'
    silent! execute 'set guifont='.font
  endif
endfunction

" }}}

" -- Mappings ------------------------------------------------------ {{{

" Map `SetFontSize`
command! -nargs=1 FontSize call SetFontSize(<q-args>)

" }}}

" vim:foldmethod=marker
