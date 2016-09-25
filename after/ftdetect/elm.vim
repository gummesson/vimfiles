if executable('elm-format')
  command! -bang Format silent! !elm-format --yes %
endif
