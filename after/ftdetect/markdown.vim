augroup MARKDOWN
  autocmd!
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
  autocmd FileType markdown DittoOn
augroup END
