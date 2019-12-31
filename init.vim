"-------------------------------------------------------------------------------------------------------------------------------
set nocompatible " Must be first line
scriptencoding utf-8
set encoding=utf8

"-------------------------------------------------------------------------------------------------------------------------------
let repo_folder = '~/.local/share/nvim/site/pack/spock'
"-------------------------------------------------------------------------------------------------------------------------------
if !isdirectory(expand(repo_folder))
  echo "-------------------------------------------------------------------------------------------------------------------------------"
  echo "Installing plugins..."
  echo "-------------------------------------------------------------------------------------------------------------------------------"
  echo ""
  " execute '!git clone https://github.com/k-takata/minpac ' . repo_folder . '/opt/minpac '
  execute '!git clone https://github.com/noahfrederick/vim-hemisu ' . repo_folder . '/start/vim-hemisu '
  execute '!git clone https://github.com/vim-airline/vim-airline ' . repo_folder . '/start/vim-airline '
  execute '!git clone https://github.com/vim-airline/vim-airline-themes ' . repo_folder . '/start/vim-airline-themes '
  " execute '!git clone https://github.com/ctrlpvim/ctrlp.vim ' . repo_folder . '/start/ctrlp.vim '
  execute '!git clone https://github.com/vim-jp/syntax-vim-ex ' . repo_folder . '/start/syntax-vim-ex '
  execute '!git clone https://github.com/tyru/open-browser.vim ' . repo_folder . '/start/open-browser.vim '
  execute '!git clone https://github.com/jiangmiao/auto-pairs ' . repo_folder . '/start/auto-pairs '
  execute '!git clone https://github.com/thaerkh/vim-indentguides ' . repo_folder . '/start/vim-indentguides '
  execute '!git clone https://github.com/airblade/vim-rooter ' . repo_folder . '/start/vim-rooter '
  execute '!git clone https://github.com/sbdchd/neoformat ' . repo_folder . '/start/neoformat '
  execute '!git clone https://github.com/neomake/neomake ' . repo_folder . '/start/neomake '
  execute '!git clone https://github.com/terryma/vim-multiple-cursors ' . repo_folder . '/start/vim-multiple-cursors '
  execute '!git clone https://github.com/Shougo/deoplete.nvim ' . repo_folder . '/start/deoplete.nvim '
  execute '!git clone https://github.com/davidhalter/jedi-vim ' . repo_folder . '/start/jedi-vim '
  execute '!git clone https://github.com/zchee/deoplete-jedi ' . repo_folder . '/start/deoplete-jedi '
  execute '!git clone https://github.com/tweekmonster/deoplete-clang2 ' . repo_folder . '/start/deoplete-clang2 '
  execute '!git clone https://github.com/sebastianmarkow/deoplete-rust ' . repo_folder . '/start/deoplete-rust '
  execute '!git clone https://github.com/deoplete-plugins/deoplete-go ' . repo_folder . '/start/deoplete-go '
  execute '!git clone https://github.com/fatih/vim-go ' . repo_folder . '/start/vim-go '
  execute '!git clone https://github.com/junegunn/fzf.vim ' . repo_folder . '/start/fzf.vim '
" https://kassioborges.dev/2019/04/10/neovim-fzf-with-a-floating-window.html
"https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
"https://sidneyliebrand.io/blog/how-fzf-and-ripgrep-improved-my-workflow

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
" set t_Co=256

" set lines=55 columns=238

"---%<---------------------------------------------------------------------------------------------------------------------------
" => airline
"--------------------------------------------------------------------------------------------------------------------------------
let g:airline_theme = 'badwolf' 

"---%<---------------------------------------------------------------------------------------------------------------------------
" =>  netrw
"--------------------------------------------------------------------------------------------------------------------------------
let g:netrw_banner = 0     " Hide annoying 'help' banner
let g:netrw_liststyle = 3  " Use tree view
" let g:netrw_winsize = '30' " Smaller default window size

" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25

" autocmd FileType netrw setl bufhidden=wipe

" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Lexplore
" augroup END

" close if final buffer is netrw or the quickfix
augroup finalcountdown
 " au!
 " autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' | q | endif
 " autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
 " nmap - :Lexplore<cr>
 " nmap - :NERDTreeToggle<cr>
augroup END

augroup xxx
  autocmd!
  " autocmd BufWinLeave * <esc> :bw
  " autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' | q | endif
augroup END

" au FileType netrw au BufLeave <buffer> :bd expand('<abuff>')
" au FileType netrw au BufLeave <buffer> :echo getbufvar(winbufnr(winnr()), "&filetype")
" au FileType netrw au BufLeave <buffer> :echo winnr('$')
" autocmd BufWinLeave * if "&filetype" == "netrw" | :echo "XxXxX" | endif
" autocmd BufLeave netrw :call DeleteHiddenBuffers() 
autocmd BufLeave netrw :bw <cr>
"---%<---------------------------------------------------------------------------------------------------------------------------
" => ctrlp -> f5 - clear cache :f7 - clear mru
"--------------------------------------------------------------------------------------------------------------------------------
let g:ctrlp_mruf_default_order=1
let g:ctrlp_mruf_max = 30
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/.git/.*'
let g:ctrlp_open_multiple_files = '1vjr'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_clear_cache_on_exit = 1 " 0 - Enable cross-session caching 1 - Disable cross-session caching
let g:ctrlp_show_hidden = 0 " 1 - Enable to scan for dotfiles and dotdirs
let g:ctrlp_by_filename = 1 " 0 - To searching by full path
let g:ctrlp_use_caching = 0 " 0 - Disable caching 1 - Enable caching
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_user_command = 'rg %s --files --color=never '
" let g:ctrlp_root_markers = ['build.gradle','pom.xml', '.p4ignore','.git']
let g:ctrlp_working_path_mode = 'w'
" let g:ctrlp_match_window = 'top,order:ttb,min:100,max:100'
let g:ctrlp_match_window = 'bottom,order:ttb,min:50,max:50'


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

autocmd FileType java setlocal omnifunc=javacomplete#Complete

"autocmd BufWinEnter quickfix nnoremap <silent> <buffer> q :cclose<cr>:lclose<cr>
"autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) | bd| q | endif

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * :silent! checktime




"---%<---------------------------------------------------------------------------------------------------------------------------
" => fzf
"--------------------------------------------------------------------------------------------------------------------------------
let g:fzf_height = 50


