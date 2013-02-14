" HTML5
syntax keyword htmlTagName contained article aside audio canvas command datalist
syntax keyword htmlTagName contained details embed figcaption figure footer header
syntax keyword htmlTagName contained hgroup keygen mark meter nav output progress
syntax keyword htmlTagName contained rp rt ruby section source summary time video

syntax keyword htmlArg contained autofocus placeholder min max step
syntax keyword htmlArg contained contenteditable contextmenu draggable hidden item
syntax keyword htmlArg contained itemprop list subject spellcheck

" Jekyll
syntax match PreProc /\v^(---)$(\_.*)^(---)$/    " YAML front matter  
syntax match Float   /\v\{(\{|\%)(.*)(\%|\})\}/  " Liquid tags
