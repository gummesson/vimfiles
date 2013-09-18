" Set various filetypes to JavaScript
au BufRead,BufNewFile *{bowerrc,jshintrc} set filetype=javascript
au BufRead,BufNewFile * call BinaryFile()

" Node.js binaries
function! BinaryFile()
  let line = getline(1)
  if line =~ 'node'
    set filetype=javascript
  endif
endfunction
