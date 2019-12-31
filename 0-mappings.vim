scriptencoding utf-8
"---%<---------------------------------------------------------------------------------------------------------------------------
" => key mappings
"--------------------------------------------------------------------------------------------------------------------------------
let mapleader = "\\"

nmap <F2> :set relativenumber!<cr>
nmap <F3> :set wrap!<cr>
nmap <F4> :set hlsearch!<cr>
" nmap <F5> :windo lcl\|ccl<CR>
nmap <F5> :cclose <bar> lclose<CR>
nmap <F9> :checktime<cr>
noremap <c-A-l> :Neoformat<cr>


" nmap <c-e> :Explore<cr>
nmap <c-e> :exe ExploreOpen()<cr>
" map <c-e> :call ToggleNetrw() <CR>
" map <c-e> :call ExOpen() <CR>

nnoremap <leader>w :w !sudo tee % >/dev/null
nnoremap <leader>d :bdelete<cr>
nnoremap <c-_> :call DoComment()<cr>
vnoremap <c-_> :call DoComment()<cr>

"---%<---------------------------------------------------------------------------------------------------------------------------
" => deoplete 
"--------------------------------------------------------------------------------------------------------------------------------
"inoremap <c-Space> <c-x><c-o>
"inoremap <c-@> <c-x><c-o>
" inoremap <c-Space> <c-N>

" inoremap <silent><expr> <TAB>
		" \ pumvisible() ? "\<C-n>" :
		" \ <SID>check_back_space() ? "\<TAB>" :
		" \ deoplete#mappings#manual_complete()
		" function! s:check_back_space() abort "{{{
		" let col = col('.') - 1
		" return !col || getline('.')[col - 1]  =~ '\s'
		" endfunction"}}}

"---%<---------------------------------------------------------------------------------------------------------------------------
" => system clipboard
"--------------------------------------------------------------------------------------------------------------------------------
vmap <c-c> "+yi
vmap <c-x> "+c
vmap <c-v> c<ESC>"+p
imap <c-v> <ESC>"+pa

noremap <Leader>p "0p
vnoremap <Leader>p "0p

"---%<---------------------------------------------------------------------------------------------------------------------------
" => search / replace
"--------------------------------------------------------------------------------------------------------------------------------
vnoremap <s-h> "hy:%s/<c-r>h/<c-r>h/gcI<left><left><left><left>
noremap <c-h> "hy:%s/<c-r><c-w>/<c-r><c-w>/gcI<left><left><left><left>

vnoremap <s-f> "hy:vimgrep /<c-r>h/ **/*<left><left><left><left><left><left><left><left>
noremap <c-f> "hy:vimgrep /<c-r><c-w>/ **/*<left><left><left><left><left><left><left><left>

noremap <c-s> :let @"=expand("%:P")<cr>"hy:save <c-r>"

"---%<---------------------------------------------------------------------------------------------------------------------------
" => ctrlp 
"--------------------------------------------------------------------------------------------------------------------------------
" let g:ctrlp_map = '<c-p>'
" nmap <c-b> :CtrlPBuffer<cr>
" nmap <c-m> :CtrlPMRU<cr>

let g:ctrlp_prompt_mappings = {
      \ 'MarkToOpen()':['<c-space>'],
      \ 'OpenMulti()' :['<c-enter>'],
      \ }
      


"---%<---------------------------------------------------------------------------------------------------------------------------
" => fzf 
"--------------------------------------------------------------------------------------------------------------------------------

nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-m> :History<cr>


