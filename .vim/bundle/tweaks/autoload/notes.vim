" A poor man's Notational Velocity/ResophNotes Vim plugin
function! notes#List(pattern)
  if strlen(a:pattern) == 0
    silent! execute 'Sexplore '.g:notes_directory
  else
    silent! execute 'lcd '.g:notes_directory.' | vimgrep /'.a:pattern.'/gj *.'.g:notes_extension.' | copen'
  endif
endfunction

function! notes#New(filename)
  if strlen(a:filename) == 0
    echom "No filename!"
  else
    silent! execute 'enew | lcd '.g:notes_directory.' | w '.a:filename.'.'.g:notes_extension
  endif
endfunction
