" -- init.vim ------------------------------------------------------ {{{
"
" -- General
" -- Visual
" -- Groups
" -- Mappings
"
" }}}

" -- General ------------------------------------------------------- {{{

" Use the `.vimrc` file for base configuration
source ~/.vimrc

" }}}

" -- Visual -------------------------------------------------------- {{{

set inccommand=nosplit  " Preview substitutions

" }}}

" -- Groups -------------------------------------------------------- {{{

augroup TERM
  autocmd BufEnter term://* startinsert
augroup END

" }}}

" -- Mappings ------------------------------------------------------ {{{

" -- Keys --

" Switch to normal mode with `Esc`
tnoremap <Esc> <C-\><C-n>

" }}}

" vim:foldmethod=marker
