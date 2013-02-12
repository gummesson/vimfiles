" Jekyll
syntax match PreProc /\v^(\-\-\-)(\_.*)^(\-\-\-)/  " YAML front matter  

" CriticMarkup
syntax match Boolean  /\v\{(\+\+)(\_.*)(\+\+)\}/              " Addition (green)
syntax match PreProc  /\v\{(\-\-)(\_.*)(\-\-)\}/              " Deletion (red)
syntax match Keyword  /\v\{(\~\~)(\_.*)(\~\>)(\_.*)(\~\~)\}/  " Subsitution (yellow)
syntax match Type     /\v\{(\>\>)(\_.*)(\<\<)\}/              " Comment (blue)
syntax match Constant /\v\{\{(\_.*)\}\}/                      " Highlight (purple)
