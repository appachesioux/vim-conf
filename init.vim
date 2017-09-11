set nocompatible " Must be first line
scriptencoding utf-8
set encoding=utf8

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting

"-------------------------------------------------------------------------------------------------------------------------------
if !filereadable(expand('~/.config/nvim/repos/github.com/Shougo/dein.vim/autoload/dein.vim'))
  echo "-------------------------------------------------------------------------------------------------------------------------------"
  echo "Installing dein.vim"
  echo "-------------------------------------------------------------------------------------------------------------------------------"
  echo ""
  silent !git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/repos/github.com/Shougo/dein.vim
endif
"-------------------------------------------------------------------------------------------------------------------------------
" Required:
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.config/nvim')

" Let dein manage dein
" Required:
call dein#add('~/.config/nvim/repos/github.com/Shougo/dein.vim')

call dein#add('Shougo/vimproc.vim', {'build' : 'make'})  
call dein#add('Shougo/vimshell')
call dein#add('Shougo/echodoc.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/vimfiler.vim') 
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('neomake/neomake')
call dein#add('sukima/xmledit')
call dein#add('evanmiller/nginx-vim-syntax')
call dein#add('elixir-editors/vim-elixir')
call dein#add('raichoo/haskell-vim')
call dein#add('plasticboy/vim-markdown')
call dein#add('Shirk/vim-gas')
call dein#add('vim-scripts/mips.vim')
call dein#add('mattn/emmet-vim')
call dein#add('brooth/far.vim')
call dein#add('justmao945/vim-clang', {'on_ft': ['c', 'cpp']})
call dein#add('udalov/kotlin-vim', {'on_ft': ['kt']})
call dein#add('hdima/python-syntax', {'on_ft': ['py']})
call dein#add('pangloss/vim-javascript', {'on_ft': ['js']}) 
call dein#add('mxw/vim-jsx')
call dein#add('elzr/vim-json', {'on_ft': ['json']})
call dein#add('tweekmonster/deoplete-clang2')
call dein#add('fatih/vim-go')
call dein#add('zchee/deoplete-go')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('sbdchd/neoformat')
call dein#add('mhinz/vim-signify')
call dein#add('jiangmiao/auto-pairs')
call dein#add('thaerkh/vim-indentguides')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-dispatch')
call dein#add('airblade/vim-rooter')
call dein#add('yssl/QFEnter')
call dein#add('morhetz/gruvbox')
call dein#add('NLKNguyen/papercolor-theme')
"call dein#add('ivalkeen/vim-simpledb')
"call dein#add('terryma/vim-multiple-cursors')

" Required:
call dein#end()

if dein#check_install()
  echo "-------------------------------------------------------------------------------------------------------------------------------"
  echo "Installing Plugins"
  echo "-------------------------------------------------------------------------------------------------------------------------------"

  :call dein#install()
endif


"---%<---------------------------------------------------------------------------------------------------------------------------
" => others configs
"--------------------------------------------------------------------------------------------------------------------------------
source ~/.config/nvim/0-functions.vim
"source ~/.config/nvim/0-commands.vim
source ~/.config/nvim/0-mappings.vim
source ~/.config/nvim/0-ignore.vim
"-------------------------------------------------------------------------------------------------------------------------------

set background=dark 
colorscheme PaperColor

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
set nofoldenable
set ruler
set noerrorbells
set novisualbell
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

let mapleader = "\<space>"

"-------------------------------------------------------------------------------------------------------------------------------

"set list 
"set listchars=tab:»-,trail:·,eol:¶,extends:>,precedes:< 
set t_Co=256

"---%<---------------------------------------------------------------------------------------------------------------------------
" => commands
"--------------------------------------------------------------------------------------------------------------------------------

autocmd FileType vimfiler nmap <silent> <buffer> <Esc> :bd<cr>
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
autocmd! BufWritePost * Neomake

autocmd BufNewFile,BufRead *.go set filetype=go 
autocmd BufNewFile,BufRead *.java set filetype=java 
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.ddl set filetype=sql
autocmd BufNewFile,BufRead *.vim setfiletype vim


"---%<---------------------------------------------------------------------------------------------------------------------------
" => indentLine
"--------------------------------------------------------------------------------------------------------------------------------
let g:indentLine_char = '│'
let g:indentLine_color_term = 000

"---%<---------------------------------------------------------------------------------------------------------------------------
" => qfenter
"--------------------------------------------------------------------------------------------------------------------------------
let g:qfenter_enable_autoquickfix=1

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']      

"---%<---------------------------------------------------------------------------------------------------------------------------
" => Neoformat
"--------------------------------------------------------------------------------------------------------------------------------
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

"---%<---------------------------------------------------------------------------------------------------------------------------
" => airline
"--------------------------------------------------------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

"---%<---------------------------------------------------------------------------------------------------------------------------
" => deoplete
"--------------------------------------------------------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

"---%<---------------------------------------------------------------------------------------------------------------------------
" => vim-go
"--------------------------------------------------------------------------------------------------------------------------------
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"
let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1
let g:go_def_mode = 'guru'
let g:go_highlight_operators = 1
  
"---%<---------------------------------------------------------------------------------------------------------------------------
" => NeoMake - read and write operations
"--------------------------------------------------------------------------------------------------------------------------------
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_open_list = 2

"---%<---------------------------------------------------------------------------------------------------------------------------
" => ag / grep
"--------------------------------------------------------------------------------------------------------------------------------
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c%m
let g:ackprg = 'ag --vimgrep'

"---%<---------------------------------------------------------------------------------------------------------------------------
" => ctrlp -> f5 - clear cache :f7 - clear mru
"--------------------------------------------------------------------------------------------------------------------------------
let g:ctrlp_match_window = 'top,order:ttb,min:100,max:100,results:50'
let g:ctrlp_open_multiple_files = '1vjr'
let g:ctrlp_mruf_max = 20
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_clear_cache_on_exit = 0 " 1 - Disable cross-session caching
let g:ctrlp_show_hidden = 0 " 1 - Enable to scan for dotfiles and dotdirs 
let g:ctrlp_by_filename = 1 " 0 - To searching by full path

let g:ctrlp_use_caching = 0 " 0 - Disable caching 1 - Enable caching
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"---%<---------------------------------------------------------------------------------------------------------------------------
" => vimfiler
"--------------------------------------------------------------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1

