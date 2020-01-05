"-------------------------------------------------------------------------------------------------------------------------------
set nocompatible " Must be first line
scriptencoding utf-8
set encoding=utf8

" set exrc
" set secure

"-------------------------------------------------------------------------------------------------------------------------------
let repo_folder = '~/.local/share/nvim/site/pack/spock'
"-------------------------------------------------------------------------------------------------------------------------------
if !isdirectory(expand(repo_folder))
  echo "-------------------------------------------------------------------------------------------------------------------------------"
  echo "Installing plugins..."
  echo "-------------------------------------------------------------------------------------------------------------------------------"
  echo ""

  " execute '!git clone https://github.com/vim-airline/vim-airline ' . repo_folder . '/start/vim-airline '
  " execute '!git clone https://github.com/vim-airline/vim-airline-themes ' . repo_folder . '/start/vim-airline-themes '
  " execute '!git clone https://github.com/itchyny/lightline.vim ' . repo_folder . '/start/lightline.vim '


  " execute '!git clone https://github.com/tpope/vim-vinegar ' . repo_folder . '/start/vim-vinegar '
  execute '!git clone https://github.com/junegunn/fzf.vim ' . repo_folder . '/start/fzf.vim '

  " execute '!git clone https://github.com/k-takata/minpac ' . repo_folder . '/opt/minpac '
  execute '!git clone https://github.com/noahfrederick/vim-hemisu ' . repo_folder . '/start/vim-hemisu '
  " execute '!git clone https://github.com/ctrlpvim/ctrlp.vim ' . repo_folder . '/start/ctrlp.vim '
  " execute '!git clone https://github.com/vim-jp/syntax-vim-ex ' . repo_folder . '/start/syntax-vim-ex '
  " execute '!git clone https://github.com/tyru/open-browser.vim ' . repo_folder . '/start/open-browser.vim '
  execute '!git clone https://github.com/jiangmiao/auto-pairs ' . repo_folder . '/start/auto-pairs '
  execute '!git clone https://github.com/thaerkh/vim-indentguides ' . repo_folder . '/start/vim-indentguides '
  execute '!git clone https://github.com/airblade/vim-rooter ' . repo_folder . '/start/vim-rooter '
  execute '!git clone https://github.com/sbdchd/neoformat ' . repo_folder . '/start/neoformat '
  execute '!git clone https://github.com/neomake/neomake ' . repo_folder . '/start/neomake '
  " execute '!git clone https://github.com/terryma/vim-multiple-cursors ' . repo_folder . '/start/vim-multiple-cursors '
  " execute '!git clone https://github.com/Shougo/deoplete.nvim ' . repo_folder . '/start/deoplete.nvim '
  " execute '!git clone https://github.com/davidhalter/jedi-vim ' . repo_folder . '/start/jedi-vim '
  " execute '!git clone https://github.com/zchee/deoplete-jedi ' . repo_folder . '/start/deoplete-jedi '
  " execute '!git clone https://github.com/tweekmonster/deoplete-clang2 ' . repo_folder . '/start/deoplete-clang2 '
  " execute '!git clone https://github.com/sebastianmarkow/deoplete-rust ' . repo_folder . '/start/deoplete-rust '
  " execute '!git clone https://github.com/deoplete-plugins/deoplete-go ' . repo_folder . '/start/deoplete-go '
  execute '!git clone https://github.com/fatih/vim-go ' . repo_folder . '/start/vim-go '
  " execute '!git clone https://github.com/daniel-samson/project-tree.vim ' . repo_folder . '/start/project-tree '

  " execute '!git clone https://github.com/exvim/ex-project ' . repo_folder . '/start/ex-project '
  " execute '!git clone https://github.com/mengelbrecht/lightline-bufferline ' . repo_folder . '/start/lightline-bufferline '
  execute '!git clone https://github.com/ryanoasis/vim-devicons ' . repo_folder . '/start/vim-devicons '
  execute '!git clone https://github.com/rbong/vim-crystalline ' . repo_folder . '/start/vim-crystalline '
  execute '!git clone https://github.com/srstevenson/vim-picker ' . repo_folder . '/start/vim-picker '
  execute '!git clone https://github.com/jremmen/vim-ripgrep ' . repo_folder . '/start/vim-ripgrep '


" https://kassioborges.dev/2019/04/10/neovim-fzf-with-a-floating-window.html
"https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
"https://sidneyliebrand.io/blog/how-fzf-and-ripgrep-improved-my-workflow
  execute '!mkdir -p ~/.local/share/nvim/site/pack/coc/start; cd ~/.local/share/nvim/site/pack/coc/start; curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -'
  execute '!npm install -g neovim '

  execute '!pip install jedi'
  execute '!pip install pynvim'
  "execute '!pip install yapf'
endif
"-------------------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------------------
" https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
"-------------------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------------------

set termguicolors
set guicursor=

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting

"---%<---------------------------------------------------------------------------------------------------------------------------
" => others configs
"--------------------------------------------------------------------------------------------------------------------------------
source ~/.config/nvim/0-functions.vim
source ~/.config/nvim/0-mappings.vim
source ~/.config/nvim/0-ignore.vim
"-------------------------------------------------------------------------------------------------------------------------------
set title titlestring=
"set clipboard+=unnamedplus

"colorscheme PaperColor
"colorscheme eclipse
"colorscheme amlight
"colorscheme bclear
"colorscheme garden
colorscheme hemisu
set background=light " dark or light

set ignorecase " Case insensitive search
set smartcase  " Case sensitive when uc present

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set number
set hidden " Allow buffer switching without saving
set nowrap         " Do not wrap long lines

"---------------------------------------------------------------------------
set autoindent     " Indent at the same level of the previous line
set shiftwidth=2   " Use indents of 2 spaces
set softtabstop=2  " Let backspace delete indent
set nojoinspaces   " Prevents inserting two spaces after punctuation on a join (J)
set numberwidth=2
" set nofoldenable
set ruler
" set noerrorbells
" set novisualbell
set smarttab
set expandtab      " Tabs are spaces, not tabs
set tabstop=2      " An indentation every four columns
"set list lcs=tab:\┊\

"---------------------------------------------------------------------------

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

"-------------------------------------------------------------------------------------------------------------------------------

"set list
"set listchars=tab:»-,trail:·,eol:¶,extends:>,precedes:<
set t_Co=256

" set lines=55 columns=238

"---%<---------------------------------------------------------------------------------------------------------------------------
" => airline
"--------------------------------------------------------------------------------------------------------------------------------
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:powerline_pycmd="py3"
" let g:airline_theme = 'dark'
let g:airline_theme = 'badwolf' 


"---%<---------------------------------------------------------------------------------------------------------------------------
" => lightline
"--------------------------------------------------------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerlineish',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }




" set showtabline=2 
" let g:lightline#bufferline#show_number  = 1
" let g:lightline#bufferline#shorten_path = 0
" let g:lightline#bufferline#unnamed      = '[No Name]'


let g:lightline                  = {}
let g:lightline = { 'colorscheme': 'landscape' }
" let g:lightline = { 'colorscheme': 'powerlineish' }
" let g:lightline = { 'colorscheme': 'PaperColor' }


let g:lightline.mod_map = {'c': 'NORMAL' }
let g:lightline.active = {'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ] }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = {'left': '', 'right': '' }
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}

" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()


"---%<---------------------------------------------------------------------------------------------------------------------------
" =>  crystalline
"--------------------------------------------------------------------------------------------------------------------------------
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  " if a:current
    " let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  " endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'

" let g:crystalline_theme = 'solarized'
" let g:crystalline_theme = 'papercolor'
" let g:crystalline_theme = 'onedark'
" let g:crystalline_theme = 'molokai'
" let g:crystalline_theme = 'jellybeans'
" let g:crystalline_theme = 'hybrid'
" let g:crystalline_theme = 'dracula'
" let g:crystalline_theme = 'badwolf'

" let g:crystalline_theme = 'default'
let g:crystalline_theme = 'gruvbox'

set showtabline=2
set guioptions-=e
set laststatus=2

"---%<---------------------------------------------------------------------------------------------------------------------------
" => picker
"--------------------------------------------------------------------------------------------------------------------------------
let g:picker_custom_find_executable = 'rg'
let g:picker_custom_find_flags = '--color never --files'

let g:picker_selector_executable = 'fzf'
let g:picker_selector_flags = ''

" let g:picker_split = 'topleft'
let g:picker_height = 50

"---%<---------------------------------------------------------------------------------------------------------------------------
" =>  netrw
"--------------------------------------------------------------------------------------------------------------------------------
let g:netrw_banner = 0     " Hide annoying 'help' banner
let g:netrw_liststyle = 3  " Use tree view
let g:netrw_winsize = 25 " Smaller default window size
let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_chgwin = winnr()

" let g:netrw_keepdir = 0

" set autochdir
" set browsedir=current

" autocmd FileType netrw setl bufhidden=wipe
" autocmd FileType netrw set nolist

" let g:netrw_list_hide= '.*\.png$,.*\.pdf,.*\.mp4,.*\.tga,.*\.mp3,.*\.jpg,.*\.svg,/*\.stl,.*\.mtl,.*\.ply' 
let g:netrw_list_hide = &wildignore

" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Lexplore
" augroup END

function! s:seek(file) abort
  if get(b:, 'netrw_liststyle') == 2
    let pattern = '\%(^\|\s\+\)\zs'.escape(a:file, '.*[]~\').'[/*|@=]\=\%($\|\s\+\)'
  else
    let pattern = '^\%(| \)*'.escape(a:file, '.*[]~\').'[/*|@=]\=\%($\|\t\)'
  endif
  call search(pattern, 'wc')
  return pattern
endfunction

"---%<---------------------------------------------------------------------------------------------------------------------------
" => xXx - autocmd
"--------------------------------------------------------------------------------------------------------------------------------
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
autocmd! BufWritePost * Neomake

"autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
"autocmd FileType xml setlocal foldmethod=syntax
"autocmd FileType php setl ofu=phpcomplete#CompletePHP
"autocmd FileType ruby,eruby setlocal ofu=rubycomplete#Complete
"autocmd FileType html,xhtml setlocal ofu=htmlcomplete#CompleteTags
"autocmd FileType c setlocal ofu=ccomplete#CompleteCpp
"autocmd FileType css setlocal ofu=csscomplete#CompleteCSS

" autocmd BufAdd,BufNewFile,BufRead * nested if "|help|netrw|" !~  &buftype | tab sball | endif

"---%<---------------------------------------------------------------------------------------------------------------------------
" => commands
"--------------------------------------------------------------------------------------------------------------------------------
function MaximizeWindow()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.java set filetype=java
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.ddl set filetype=sql
autocmd BufNewFile,BufRead *.vim setfiletype vim
autocmd BufNewFile,BufRead *.properties setfiletype properties

" autocmd FileType java setlocal omnifunc=javacomplete#Complete

"autocmd BufWinEnter quickfix nnoremap <silent> <buffer> q :cclose<cr>:lclose<cr>
"autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) | bd| q | endif

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * :silent! checktime




"---%<---------------------------------------------------------------------------------------------------------------------------
" => fzf
"--------------------------------------------------------------------------------------------------------------------------------
" let g:fzf_height = 50

let g:fzf_layout = { 'window': 'enew' }

nnoremap <silent> <leader>e :call Fzf_dev()<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

"---%<---------------------------------------------------------------------------------------------------------------------------
" => coc
"--------------------------------------------------------------------------------------------------------------------------------
" set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"---%<---------------------------------------------------------------------------------------------------------------------------
" => fzy
"--------------------------------------------------------------------------------------------------------------------------------
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction


nnoremap <leader>e :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . --silent -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . --silent -l -g ''", ":sp")<cr>

