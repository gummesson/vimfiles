" -- Mappings ------------------------------------------------------ {{{

if executable('elm-format')
  nnoremap <buffer> § :silent! !elm-format --yes %<CR>
endif

" }}}

" vim:foldmethod=marker
