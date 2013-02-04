"
" ~ Peppermint Colorscheme ~
"
"  Colors adapted from Noah Frederick's Peppermint Terminal.app theme
"  (http://noahfrederick.com/blog/2011/lion-terminal-theme-peppermint/)
"
"  It's mostly designed to look good with Ruby and CSS/SCSS files and 
"  currently only works in GUI mode.
"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "peppermint"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   guibg=#444444
  hi ColorColumn  guibg=#444444
  hi MatchParen   guifg=#4c4c4c guibg=#737373 gui=bold
  hi Pmenu        guifg=#e6e6e6 guibg=#444444
  hi PmenuSel     guifg=#444444 guibg=#e6e6e6
endif

" General colors
hi Cursor        guifg=NONE    guibg=#ff6685 gui=NONE
hi Normal        guifg=#e6e6e6 guibg=#4c4c4c gui=NONE
hi NonText       guifg=#737373 guibg=#4c4c4c gui=NONE
hi LineNr        guifg=#737373 guibg=#444444 gui=NONE
hi StatusLine    guifg=#e6e6e6 guibg=#444444 gui=bold
hi StatusLineNC  guifg=#737373 guibg=#444444 gui=NONE
hi VertSplit     guifg=#444444 guibg=#444444 gui=NONE
hi Folded        guibg=#444444 guifg=#e6e6e6 gui=bold
hi Title         guifg=#e6e6e6 guibg=NONE    gui=bold
hi Visual        guifg=#e6e6e6 guibg=#ff6685 gui=NONE
hi SpecialKey    guifg=#444444 guibg=#e6e6e6 gui=NONE

" Syntax highlighting
hi Comment     guifg=#737373 gui=italic
hi Boolean     guifg=#a6eba6 gui=NONE
hi String      guifg=#86d1d7 gui=NONE
hi Identifier  guifg=#a6eba6 gui=NONE
hi Function    guifg=#dbdbdb gui=NONE
hi Type        guifg=#5dc6f5 gui=NONE
hi Statement   guifg=#86d1d7 gui=NONE
hi Keyword     guifg=#ffdc72 gui=NONE
hi Constant    guifg=#ff8fff gui=NONE
hi Number      guifg=#ffdc72 gui=NONE
hi Special     guifg=#ffdc72 gui=NONE
hi PreProc     guifg=#ff6685 gui=NONE

" Language specific (HTML)
hi Underlined  gui=NONE
