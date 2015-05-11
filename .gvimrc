" -- .gvimrc ------------------------------------------------------- {{{
"
" -- Interface
" -- Colorscheme
" -- Font
" -- Groups
" -- Mappings
"
" }}}


" -- Interface ----------------------------------------------------- {{{

set guioptions=c                " Remove all GUI features
set guicursor=a:block-blinkon0  " Use a non blinking block cursor

" Set window size
set lines=35
set columns=140

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

" -- Mappings ------------------------------------------------------ {{{

" Window creation
nnoremap <A-s> <C-W>s
nnoremap <A-v> <C-W>v

" Window navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" }}}

" vim:foldmethod=marker
