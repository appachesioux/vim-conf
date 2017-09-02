scriptencoding utf-8
"---%<---------------------------------------------------------------------------------------------------------------------------
" => functions
"--------------------------------------------------------------------------------------------------------------------------------
"function! FormatCode()
"  let winview=winsaveview()
"
"  if index(['j-ava','g-roovy','c-pp','c-'], &filetype) > -1 
    " :% !uncrustify -c ~/conf/vim/uncrustify.spock --no-backup 2>/dev/null
    " :%JavaFormat
    " elseif  &filetype == "go"
    "   :GoFmt   
"  else
"    exe "normal gg=G"   
 " endif
"
"  call winrestview(winview)
"endfunction

" Restore cursor to file position in previous editing session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


