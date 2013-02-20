" ~ Notes ~
if exists("g:loaded_notes_plugin") || &cp
  finish
endif

let g:loaded_notes_plugin = 1

if !exists("g:notes_directory")
  if has("unix")
    let g:notes_directory = "~/Notes"
  else
    let g:notes_directory = "C:\Notes"
  endif
endif

" Command-line mappings
command! -nargs=* Notes call notes#All(<f-args>)
command! -nargs=1 Note call notes#New(<f-args>)
