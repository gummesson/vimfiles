" ~ Peppermint Colorscheme ~
"
"  Colors adapted from Noah Frederick's Peppermint Terminal.app theme
"  (http://noahfrederick.com/blog/2011/lion-terminal-theme-peppermint/)
"
"  It's mostly designed to look good with Ruby and CSS/SCSS files and 
"  currently only works in GUI mode.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "peppermint"

" Vim >= 7.0
if version >= 700
  hi CursorLine                 guibg=#444444 gui=NONE
  hi ColorColumn                guibg=#444444 gui=NONE
  hi MatchParen   guifg=#4c4c4c guibg=#737373 gui=bold
  hi Pmenu        guifg=#e6e6e6 guibg=#444444 gui=NONE
  hi PmenuSel     guifg=#ff6685 guibg=#444444 gui=bold
endif

" General
hi Cursor        guifg=#e6e6e6 guibg=#ff6685 gui=NONE
hi Normal        guifg=#e6e6e6 guibg=#4c4c4c gui=NONE
hi NonText       guifg=#737373 guibg=#4c4c4c gui=NONE
hi Visual        guifg=#e6e6e6 guibg=#ff6685 gui=NONE
hi Search        guifg=#e6e6e6 guibg=#ff6685 gui=NONE

" Window
hi LineNr        guifg=#737373 guibg=#444444 gui=NONE
hi VertSplit     guifg=#444444 guibg=#444444 gui=NONE
hi Folded        guifg=#e6e6e6 guibg=#444444 gui=bold

" Status line
hi StatusLine    guifg=#e6e6e6 guibg=#444444 gui=bold
hi StatusLineNC  guifg=#737373 guibg=#444444 gui=bold
hi WildMenu      guifg=#5dc6f5 guibg=#4c4c4c gui=bold
hi Question      guifg=#ffdc72 guibg=#4c4c4c gui=bold

" Messages
hi ModeMsg       guifg=#ff6685 guibg=#444444 gui=bold
hi ErrorMsg      guifg=#ffdc72 guibg=#444444 gui=bold
hi WarningMsg    guifg=#ffdc72 guibg=#444444 gui=bold

" Others
hi SpecialKey    guifg=#e6e6e6 guibg=#4c4c4c gui=NONE
hi Title         guifg=#e6e6e6 guibg=NONE    gui=bold

" Syntax highlighting
hi Comment     guifg=#737373                 gui=italic
hi Boolean     guifg=#a6eba6                 gui=NONE
hi String      guifg=#86d1d7                 gui=NONE
hi Identifier  guifg=#a6eba6                 gui=NONE
hi Function    guifg=#dbdbdb                 gui=NONE
hi Type        guifg=#5dc6f5                 gui=NONE
hi Statement   guifg=#86d1d7                 gui=bold
hi Keyword     guifg=#ffdc72                 gui=NONE
hi Constant    guifg=#ff8fff                 gui=NONE
hi Number      guifg=#ffdc72                 gui=NONE
hi Special     guifg=#ffdc72                 gui=NONE
hi PreProc     guifg=#ff6685                 gui=bold

" HTML specific syntax highlighting
hi Underlined                                gui=NONE
