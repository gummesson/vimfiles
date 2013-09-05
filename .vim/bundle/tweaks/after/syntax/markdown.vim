" Jekyll
syntax match PreProc /\v^(---)$(\_.*)^(---)$/    " YAML front matter
syntax match Float   /\v\{(\{|\%)(.*)(\%|\})\}/  " Liquid tags
syntax match Float   /\v\{:\s+(.*)\s+\}/         " kramdown blocks
