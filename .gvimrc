" -- .gvimrc ------------------------------------------------------- {{{
"
" -- General
" -- Interface
" -- Font
" -- Functions
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

if has('gui_gtk2')
  set guifont=Inconsolata\ 13.5
else
  set guifont=Inconsolata:h13
end

" }}}

" -- Functions ----------------------------------------------------- {{{

" Prose mode
function! Prose()
  if g:colors_name != 'pencil'
    colorscheme pencil
  endif
  if &background != 'light'
    set background=light
  endif
  set foldcolumn=12             " Add padding to the left side of the screen
  set scrolloff=999             " Keep the cursor centered vertically
endfunction

" Map `call Prose()` to `:Prose`
command! -bang -nargs=0 Prose call Prose()

" }}}

" vim:foldmethod=marker
