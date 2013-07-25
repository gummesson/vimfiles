" A poor man's Notational Velocity/ResophNotes Vim plugin
if exists("g:loaded_notes_plugin") || &cp
  finish
endif

let g:loaded_notes_plugin = 1

if !exists("g:notes_directory")
  if has("unix")
    let g:notes_directory = "~/Dropbox/Dokument/Anteckningar"
  else
    let g:notes_directory = "D:/Dropbox/Dokument/Anteckningar"
  endif
endif

if !exists("g:notes_extension")
  let g:notes_extension = "txt"
endif

command! -nargs=? Notes call notes#List(<q-args>)
command! -nargs=? Note call notes#New(<q-args>)
