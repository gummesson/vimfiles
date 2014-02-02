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

" Set the font size in a more convenient way
function! SetFontSize(size)
  if has('gui_win32') || has('gui_macvim')
    let name = substitute(join(split(&guifont, ':')[0:-2]), '\ ', '\\ ', 'g')
    let font = name.':h'.a:size
  else
    let name = join(split(&guifont, '\\ ')[0:-2], '\ ')
    let font = name.'\ '.a:size
  endif
  silent! execute 'set guifont='.font
endfunction

" }}}

" -- Mappings ------------------------------------------------------ {{{

" Map `SetFontSize`
command! -nargs=1 FontSize call SetFontSize(<args>)

" }}}

" vim:foldmethod=marker
