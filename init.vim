" -- init.vim ------------------------------------------------------ {{{
"
" -- General
" -- Groups
" -- Mappings
"
" }}}

" -- General ------------------------------------------------------- {{{

" Use the `.vimrc` file for base configuration
source ~/.vimrc

" }}}

" -- Groups -------------------------------------------------------- {{{

augroup TERM
  autocmd BufEnter term://* startinsert
augroup END

" }}}

" -- Mappings ------------------------------------------------------ {{{

" -- Commands --

" Switch to normal mode with `Esc`
tnoremap <Esc> <C-\><C-n>

" -- Leader --

" Open terminal
nnoremap <leader>t :vsplit<cr>:terminal<cr>

" }}}

" vim:foldmethod=marker
