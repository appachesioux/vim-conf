scriptencoding utf-8
"---%<---------------------------------------------------------------------------------------------------------------------------
" => key mappings
"--------------------------------------------------------------------------------------------------------------------------------
nmap <F2> :set relativenumber!<cr>
nmap <F3> :set wrap!<cr>
nmap <F9> :checktime<cr>
noremap <c-A-l> :Neoformat<cr>

nmap <c-b> :CtrlPBuffer<cr>
nmap <c-m> :CtrlPMRU<cr>

nmap <c-\> :VimFiler<cr>

nnoremap <c-_> :call DoComment()<cr>
vnoremap <c-_> :call DoComment()<cr>

"---%<---------------------------------------------------------------------------------------------------------------------------
" => deoplete 
"--------------------------------------------------------------------------------------------------------------------------------
"inoremap <c-Space> <c-x><c-o>
"inoremap <c-@> <c-x><c-o>
inoremap <c-Space> <c-N>

"---%<---------------------------------------------------------------------------------------------------------------------------
" => system clipboard
"--------------------------------------------------------------------------------------------------------------------------------
vmap <c-c> "+yi
vmap <c-x> "+c
vmap <c-v> c<ESC>"+p
imap <c-v> <ESC>"+pa

"---%<---------------------------------------------------------------------------------------------------------------------------
" => search / replace
"--------------------------------------------------------------------------------------------------------------------------------
vnoremap <s-r> "hy:%s/<c-r>h/<c-r>h/gcI<left><left><left><left>
noremap <c-r> "hy:%s/<c-r><c-w>/<c-r><c-w>/gcI<left><left><left><left>

" vnoremap <s-f> "hy:vimgrep /<c-r>h/gj **/*<left><left><left><left><left><left><left><left>
" noremap <c-f> "hy:vimgrep /<c-r><c-w>/gj **/*<left><left><left><left><left><left><left><left>

vnoremap <s-f> "hy:vimgrep /<c-r>h/ **/*<left><left><left><left><left><left><left><left>
noremap <c-f> "hy:vimgrep /<c-r><c-w>/ **/*<left><left><left><left><left><left><left><left>


noremap <c-s> :let @"=expand("%:P")<cr>"hy:save <c-r>"


"---%<---------------------------------------------------------------------------------------------------------------------------
" => ctrlp 
"--------------------------------------------------------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'

let g:ctrlp_prompt_mappings = {
      \ 'MarkToOpen()':['<c-space>'],
      \ 'OpenMulti()' :['<c-enter>'],
      \ }
      

