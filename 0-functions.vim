scriptencoding utf-8
"---%<---------------------------------------------------------------------------------------------------------------------------
" => functions
"--------------------------------------------------------------------------------------------------------------------------------

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

"---%<---------------------------------------------------------------------------------------------------------------------------
" => DoComment
"--------------------------------------------------------------------------------------------------------------------------------
function! DoComment()
  let s:comment_def = { 
      \   "bash_profile": '#',
      \   "bashrc": '#',
      \   "bat": 'REM',
      \   "c": '\/\/',
      \   "conf": '#',
      \   "cpp": '\/\/',
      \   "desktop": '#',
      \   "eml": '>',
      \   "fstab": '#',
      \   "go": '\/\/',
      \   "groovy": '\/\/',
      \   "java": '\/\/',
      \   "javascript": '\/\/',
      \   "lua": '--',
      \   "mail": '>',
      \   "php": '\/\/',
      \   "profile": '#',
      \   "python": '#',
      \   "ruby": '#',
      \   "rust": '\/\/',
      \   "scala": '\/\/',
      \   "sh": '#',
      \   "properties": '#',
      \   "smb": ';',
      \   "sql": '--',
      \   "tex": '%',
      \   "vim": '"',
      \ }

    if has_key(s:comment_def, &filetype)
      let comment_str = s:comment_def[&filetype]
      if getline('.') =~ "^\\s*" . comment_str . " " 
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_str . " /\\1/"
      else 
        " Comment the line
        execute "silent s/^\\(\\s*\\)/\\1" . comment_str . " /"
      end
    end
endfunction

"---%<---------------------------------------------------------------------------------------------------------------------------
" => DuplFind
"--------------------------------------------------------------------------------------------------------------------------------
function! DuplFind()
  :sort
  :g/^\(.*\)$\n\1$/p
endfunction

fun! ExploreOpen()
  " let g:last_bufnr = bufnr('%')
  " exe "Lexplore "
  " exe 'Explore' getcwd()
  
  let g:netrw_keepdir = 0
  execute '!cd ' . getcwd()
  :Explore 
  " :edit .


  let g:netrw_browse_split=0  " open files in current window

  nmap <buffer> <esc> :bd<cr>
endf

fun! ConfCoc()
   CocInstall coc-sql
   CocInstall coc-java
   CocInstall coc-flutter
   CocInstall coc-rls
   CocInstall coc-tsserver
   CocInstall coc-json
   CocInstall coc-html
   CocInstall coc-css
   CocInstall coc-python
   CocInstall coc-xml
endf

