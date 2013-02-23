"=================
"  gVim Settings
"=================
"
"  ~ General
"  ~ Interface
"  ~ Font
"  ~ Colorscheme
"  ~ Functions
"  ~ Mappings
"
"=================

"-----------
"  General
"-----------

" Autoreload Vim settings
augroup reload_gvimrc
  au!
  au BufWritePost $MYGVIMRC source $MYGVIMRC
augroup END

" Remove sound and visual error
au GUIEnter * set visualbell t_vb=

"-------------
"  Interface
"-------------

set guioptions-=T    " Hide the awful toolbar
set guioptions+=b,h  " Display a horizontal scrollbar

"--------
"  Font
"--------

if has("gui_gtk2")                          " Linux
  set guifont=Liberation\ Mono\ 10
else                                        " Windows
  set guifont=Liberation_Mono:h10:cDEFAULT
end

"---------------
"  Colorscheme
"---------------

" Use Peppermint when in GUI mode
colorscheme peppermint

"-------------
"  Functions
"-------------

" Write Mode
function! WriteMode()
  " Change colorscheme and background
  colorscheme brackets
  set background=light
  " Adjust the window
  if has("unix")     " Linux
    set lines=23
    set columns=75
  else               " Windows
    set lines=33
    set columns=100
  endif
  " Change the font size
  if has("gui_gtk2")                          " Linux
    set guifont=Liberation\ Mono\ 14
  else                                        " Windows
    set guifont=Liberation_Mono:h14:cDEFAULT
  endif
  " Remove color column (again)
  set colorcolumn=0
endfunction

" Slug
function! Slug()
  " Whitespace and forward slashes
  silent! exec 's /\v(\s+|\/)/-/g'
  " Punctuation and various other characters
  silent! exec 's /\v(\.|\?|\!|\:|\#+)//g'
  " Trailing dashes
  silent! exec 's /\v(^\-+|\-+$)//g'
  " Transform to downcase
  silent! exec 'normal! guu'
endfunction

" Markdown headings => table of contents
function! MarkdownTOC()
  let search = @/
  let filename = expand("%")
    silent! exec 'vnew | vertical resize 45 | read '.filename.' | set filetype=markdown'
    setlocal noswapfile nobuflisted buftype=nofile bufhidden=delete
    silent! exec 'file [Table of Contents] | v/^#\+/d | nohlsearch'
  let @/ = search
endfunction

"------------
"  Mappings
"------------

" Switch to Write Mode
nnoremap <leader>wm :call WriteMode()<cr>

" Map :call Slug() to :Slug
command! -range -nargs=0 Slug call Slug()

" Map :call MarkdownTOC() to :MdT
command! -range -nargs=0 MdT call MarkdownTOC()
