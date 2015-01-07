" -- .gvimrc ------------------------------------------------------- {{{
"
" -- Interface
" -- Colorscheme
" -- Font
" -- Functions
" -- Autocommmands
"
" }}}


" -- Interface ----------------------------------------------------- {{{

" Remove all GUI features
set guioptions=c

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

" Remove extraneous line spacing
set linespace=0

" }}}

" -- Functions ----------------------------------------------------- {{{

function! s:lightlineColorscheme()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    if g:colors_name =~# 'solarized'
      let g:lightline.colorscheme = g:colors_name . '_' . &background
    elseif g:colors_name =~# 'gotham'
      let g:lightline.colorscheme = g:colors_name
    else
      let g:lightline.colorscheme = 'powerline'
    endif
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  catch
  endtry
endfunction

" }}}
"
" -- Autocommmands ------------------------------------------------- {{{

augroup GUI
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=              " Remove sound and visual error
  autocmd ColorScheme * call s:lightlineColorscheme()  " Switch `lightline` theme
augroup END

" }}}

" vim:foldmethod=marker
