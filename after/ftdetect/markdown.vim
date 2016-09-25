autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd FileType markdown DittoOn
autocmd FileType markdown call litecorrect#init()
