" ~ Notes ~
function! notes#All(...)
    " List all the notes if no search term is provided...
  if a:0 == 0
    silent! exec 'Ack --text -f '.g:notes_directory
  else
    "...else do a search inside the actual notes
    let search_term = a:1
    silent! exec 'Ack --text -i --match '.search_term.' '.g:notes_directory
  endif
endfunction

function! notes#New(title)
  " Open a new buffer and save it with the given title
  silent! exec 'enew | w '.g:notes_directory.'/'.a:title.'.txt'
endfunction
