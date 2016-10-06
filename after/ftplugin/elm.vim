if executable('elm-format')
  command! -bang -nargs=1 -complete=file Format silent! !elm-format --yes <args>
  nnoremap § :Format %<CR>
endif
