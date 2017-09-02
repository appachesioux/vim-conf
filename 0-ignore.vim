scriptencoding utf-8
"---%<---------------------------------------------------------------------------------------------------------------------------
" => ignore
"--------------------------------------------------------------------------------------------------------------------------------
set wildignore+=*/tmp/** " Tmp 
set wildignore+=*.doc*,*.ppt*,*.xls*,*.ods* " office files
set wildignore+=*.zip " Compressed file
set wildignore+=*.pdf,*.PDF " PDF file
set wildignore+=*.aux,*.out,*.toc " Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " Binary Imgs
set wildignore+=*.so,*.o,*.obj,*.exe,*.dll,*.manifest,*.dcu,*.class " Compiled Object files
set wildignore+=*.spl " Compiled speolling world list
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX SHIT
set wildignore+=*.luac " Lua byte code
set wildignore+=*.pyc " Python Object codes
set wildignore+=*.orig " Merge resolution files
set wildignore+=.hg,.git,.svn " Version Controls
set wildignore+=.idea,.gradle,*/build/**,*/bin/** " Project 

"---%<---------------------------------------------------------------------------------------------------------------------------
" => ctrlp 
"--------------------------------------------------------------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.png$\|\.gif$\|\.jpg$|\.pdf$|\.rar$|\.zip$|\.exe$',
      \ }

