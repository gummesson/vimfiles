" -- Plugins ------------------------------------------------------- {{{

let b:vcm_tab_complete = 'omni'

" }}}

" -- Mappings ------------------------------------------------------ {{{

if executable('standard')
  nnoremap <buffer> § :silent! !standard --fix %<CR>
endif

" }}}

" vim:foldmethod=marker
