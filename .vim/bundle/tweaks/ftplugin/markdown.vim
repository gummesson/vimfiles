" Word wrap without line breaks
setlocal wrap
setlocal linebreak
setlocal nolist
setlocal textwidth=0
setlocal wrapmargin=0
setlocal formatoptions+=l

" Remove color column
setlocal colorcolumn=0

" Remove cursorline
setlocal nocursorline

" Remove showbreak
setlocal showbreak=

" Folding
setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolding()
setlocal foldlevel=9

" Markdown folding expression
" (http://vimcasts.org/episodes/writing-a-custom-fold-expression/)
function! MarkdownFolding()
  let line = getline(v:lnum)
  if match(line, '^#\s') >= 0
    return ">1"
  elseif match(line, '^##\s') >= 0
    return ">2"
  elseif match(line, '^###\s') >= 0
    return ">3"
  elseif match(line, '^####\s') >= 0
    return ">4"
  elseif match(line, '^#####\s') >= 0
    return ">5"
  elseif match(line, '^######\s') >= 0
    return ">6"
  else
    return "="
  endif
endfunction
