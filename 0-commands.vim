scriptencoding utf-8
"---%<---------------------------------------------------------------------------------------------------------------------------
" => xXx - autocmd
"--------------------------------------------------------------------------------------------------------------------------------
autocmd FileType vimfiler nmap <silent> <buffer> <Esc> :bd<cr>
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
autocmd! BufWritePost * Neomake

"autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
"autocmd FileType xml setlocal foldmethod=syntax
"autocmd FileType php setl ofu=phpcomplete#CompletePHP
"autocmd FileType ruby,eruby setlocal ofu=rubycomplete#Complete
"autocmd FileType html,xhtml setlocal ofu=htmlcomplete#CompleteTags
"autocmd FileType c setlocal ofu=ccomplete#CompleteCpp
"autocmd FileType css setlocal ofu=csscomplete#CompleteCSS

autocmd BufNewFile,BufRead *.go set filetype=go 
autocmd BufNewFile,BufRead *.java set filetype=java 
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.ddl set filetype=sql


