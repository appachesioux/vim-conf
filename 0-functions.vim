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


function! ToggleNetrw()
  let i = bufnr("$")
  let wasOpen = 0
  while (i >= 1)
    if (getbufvar(i, "&filetype") == "netrw")
      silent exe "bwipeout " . i
      let wasOpen = 1
    endif
    let i-=1
  endwhile
  if !wasOpen
    silent Lexplore
    silent Rex
    " silent Explore
  endif

  nmap <buffer> <esc> :bw<cr>
endfunction


fun! ExploreOpen()
  let g:last_bufnr = bufnr('%')
  exe "Explore "
  " exe "Lexplore "
  let g:netrw_browse_split=0  " open files in current window

  nmap <buffer> <esc> :bw<cr>
endf

fun! ExClose()
  if &filetype == "netrw"
    exe ':b' . g:last_bufnr
  endif
endf

function! DeleteHiddenBuffers()
  let tpbl=[]
  let closed = 0
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&mod') == 0
      silent execute 'bwipeout' buf
      let closed += 1
    endif
  endfor
  echo "Closed ".closed." hidden buffers"
endfunction



