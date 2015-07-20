" -- .gvimrc ------------------------------------------------------- {{{
"
" -- Interface
" -- Colorscheme
" -- Font
" -- Groups
" -- Plugins
"
" }}}

" -- Interface ----------------------------------------------------- {{{

set guioptions=c                " Remove all GUI features
set guicursor=a:block-blinkon0  " Use a non blinking block cursor

" Set window size
set lines=40
set columns=120

" }}}

" -- Colorscheme --------------------------------------------------- {{{

" Use curled underlines for spelling highlights (when using `pencil`)
let g:pencil_gui_spell_undercurl = 1

" Use a different colorscheme when in GUI mode
colorscheme spacegray

" }}}

" -- Font ---------------------------------------------------------- {{{

if has('unix')
  set guifont=Fira\ Mono\ 12
else
  set guifont=Fira_Mono:h12
end

" Fix font rendering
if has('win32') || has('win64')
  set renderoptions=type:directx,gamma:1.0,contrast:0.2,level:1.0,geom:1,renmode:5,taamode:1
endif

" Remove extraneous line spacing
set linespace=0

" }}}

" -- Groups -------------------------------------------------------- {{{

augroup GUI
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=  " Remove sound and visual error
augroup END

" }}}

" -- Plugins ------------------------------------------------------- {{{

" -- Thematic --

let g:thematic#themes = {
\ 'anonymous': {
\   'typeface': 'Anonymous Pro',
\   'font-size': 13
\ },
\ 'fantasque': {
\   'typeface': 'Fantasque Sans Mono',
\   'font-size': 13
\ },
\ 'fira': {
\   'typeface': 'Fira Mono',
\   'font-size': 12
\ },
\ 'terminus': {
\   'typeface': 'Terminus',
\   'font-size': 12
\ } }

" }}}

" vim:foldmethod=marker
