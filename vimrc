" header {
"   -> http://tpmusing.blogspot.com.br/2013/04/why-vim-syntastic-my-editor-has-had.html
"   -> http://haridas.in/vim-as-your-ide.html
"   -> http://www.drchip.org/astronaut/vim/index.html
"   -> http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
"   -> https://github.com/fisadev/fisa-vim-config
"   -> http://www.8t8.us/vim/ - Kevin's Vim Tips and Tricks 
"   -> pacman -S the_silver_searcher ( ag ) 
"
"   vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" tips {
" 1 - vimgrep /jrxml/gj ./**/*.java -> (:cw to view location list)
" ------------------------------------------------------------------------------
" 2 - unite
" 2.1 - <space> -> select multiple files 
" 2.2 - <enter> -> open file
" ------------------------------------------------------------------------------
" }

" Environment {
" Basics {
set nocompatible        " Must be first line
set shell=/bin/sh
" }
" }

" Use bundles config {
if filereadable(expand("~/.vimrc-bundles"))
    source ~/.vimrc-bundles
endif
" }

" General {

set background=dark         " Assume a dark background
if !has('gui')
    "set term=$TERM          " Make arrow and other keys work
endif
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8

if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif

" Most prefer to automatically switch to the current file directory when
" a new buffer is opened; to prevent this behavior, add the following to
" your .vimrc.before.local file:
"        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" Always switch to the current file directory

"set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
"    set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Setting up the directories {
set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Add exclusions to mkview and loadview
" eg: *.*, svn-commit.tmp
let g:skipview_files = [
            \ '\[example pattern\]'
            \ ]
" }

" }

" Vim UI {

colorscheme darkblack

autocmd VimEnter * :call Fullscreen()
map <silent> <F11> :call Fullscreen()<CR> 

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

highlight clear SignColumn      " SignColumn should match background for

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
endif

set autoread
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
"set relativenumber
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set wildmode=list:full,longest  " Command <Tab> completion, list matches, then longest common part, then all.

set wildignore+=*/tmp/*  "Tmp "
set wildignore+=*.zip  " Compressed file" 
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.so,*.o,*.obj,*.exe,*.dll,*.manifest,*.dcu,*.class "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=.idea,.gradle,*/build/* " Project "

" }

" Formatting {
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,go,php,javascript,python,twig,jrxml,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig


" Key (re)Mappings {

let mapleader = "," 
let g:mapleader=","

noremap <leader>ve :edit ~/.vimrc<CR> " Quickly edit .vimrc
nmap <leader>fm :call CursorPosition("normal gg=G")<CR>

nnoremap <leader>n :call NumberToggle()<CR>
nnoremap <leader>d :bdelete<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Same for 0, home, end, etc
noremap $ g$
noremap <End> g<End>
noremap 0 g0
noremap <Home> g<Home>
noremap ^ g^

" The following two lines conflict with moving to top and
" bottom of the screen
" If you prefer that functionality, add the following to your
" .vimrc.before.local file:
map <S-H> gT
map <S-L> gt

" Stupid shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

cmap Tabe tabe

" Yank(copy) to system clipboard
" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap Y y$

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Most prefer to toggle search highlighting rather than clear the current
" search results. To clear search highlighting rather than toggle it on
" and off, add the following to your .vimrc.before.local file:
nmap <silent> <leader>/ :nohlsearch<CR>
"nmap <silent> <leader>/ :set invhlsearch<CR>


" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/gc<left><left><left>
" }


" Plugins {

" PDF {
autocmd BufReadPre *.pdf set ro nowrap
autocmd BufReadPost *.pdf silent %!pdftotext "%" -nopgbrk -layout -q -eol unix - 
" }



" Misc {
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1 " or 3
let g:netrw_sort_options = 'i'

let b:match_ignorecase = 1
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.ddl set filetype=sql
autocmd BufNewFile,BufRead psql* set filetype=sql
" }

" Syntastic {
if !filereadable(expand('~/.vim/bundle/syntastic/done'))
   call system("sed '/if javac_classpath != / \a let javac_classpath = s:AddToClasspath(javac_classpath,g:syntastic_java_javac_temp_dir)' -i ~/.vim/bundle/syntastic/syntax_checkers/java/javac.vim")

   silent !touch ~/.vim/bundle/syntastic/done
endif

let g:syntastic_disabled_filetypes = ['html', 'js']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [''], 'passive_filetypes': [''] }

let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_quiet_warnings = 0
let g:syntastic_auto_loc_list = 2

let g:syntastic_auto_jump = 0
let g:syntastic_debug = 0
let g:syntastic_echo_current_error = 0

highlight SyntasticErrorSign guifg=red

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = 'w'
let g:syntastic_style_error_symbol = 's'

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_autoload_maven_classpath = 0
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_java_javac_delete_output = 0
let g:syntastic_java_javac_temp_dir = 'build/classes'
let g:syntastic_java_javac_options = '-Xlint ' . ' -d ' . g:syntastic_java_javac_temp_dir

map <leader>a :%!astyle --mode=c --style=ansi -s2 <CR><CR>

" }


" OmniComplete {
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
map <leader>a :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"---------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:clang_complete_copen = 1
let g:clang_snippets = 1
let g:clang_use_library = 1

let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

set completeopt=menuone,menu,longest
set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
"---------------------------------------------------------------------

" }

" Ctags {
set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
" }

" AutoCloseTag {
" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }

" SnipMate {
" Setting the author var
let g:snips_author = 'Appache Sioux <appache.sioux@gmail.com>'
" }

" NerdTree {
map <F2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDShutUp=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.vim$', '\.\~','\~$', '\.pyc$','\.pyc', '\.swo$', '\.swp$', '\.hg', '\.bzr', '\.svn', '\.git', '\.class', '\.dcu', '\.obj', 'build$[[dir]]']
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=0
let NERDTreeWinSize=80
let NERDTreeKeepTreeInNewTab=1


" }

" Tabularize {
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" JSON {
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
" }

" VimProc {
if !filereadable(expand('~/.vim/bundle/vimproc.vim/done'))
   silent !cd ~/.vim/bundle/vimproc.vim;make
   silent !touch ~/.vim/bundle/vimproc.vim/done
endif
" }

" Unite {
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 0
let g:unite_update_time = 200
let g:unite_data_directory='~/.cache/unite'
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_file_mru_limit = 20
let g:unite_enable_split_vertically = 1

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = '-r -i'
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('buffer,file_rec/async,file_rec,file_mru','matchers',['converter_tail', 'matcher_default'])
call unite#custom#source('file_rec/async,file_rec,file_mru', 'converters',['converter_file_directory'])

call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate','max_candidates', 0)
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep','ignore_pattern', escape(substitute(join(split(&wildignore, ","), '\|'), '**/\?', '', 'g'),'.'))

call unite#custom_default_action('file', 'tabopen')

" Mappings
nnoremap <leader>f :Unite -no-split -buffer-name=files buffer file_mru file_rec/async:!<cr>
nnoremap <Leader>t :<C-u>Unite -no-split -buffer-name=files   file<CR>
nnoremap <Leader>r :<C-u>Unite -no-split -buffer-name=mru     file_mru<CR>
nnoremap <Leader>o :<C-u>Unite -no-split -buffer-name=outline outline<CR>
nnoremap <Leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<CR>
nnoremap <Leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<CR>
"nnoremap <Leader>d :<C-u>Unite -no-split -buffer-name=change-cwd -default-action=lcd directory_mru<CR>
nnoremap <Leader>a :<C-u>Unite -no-split grep:.<CR>
nnoremap <Leader>* :<C-u>UniteWithCursorWord -no-split grep:.<CR>

nnoremap <C-l> :call ClearUniteMRU()<CR>


autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction
" }

" -------------------%<---------------------

" TagBar {
"nnoremap <silent> <leader>tt :TagbarToggle<CR>
nnoremap <F4> :TagbarToggle<cr>
inoremap <F4><ESC> :TagbarToggle<cr>

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}

" UndoTree {
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1
" }

" indent_guides {
if !exists('g:spf13_no_indent_guides_autocolor')
    let g:indent_guides_auto_colors = 1
else
    " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
endif
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
" }

" lightline {
set laststatus=2

let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \     'left': [
            \         ['mode', 'paste'],
            \         ['fugitive', 'readonly'],
            \         ['ctrlpmark', 'buffer_name']
            \     ],
            \     'right': [
            \         ['lineinfo'],
            \         ['percent', 'max_line'],
            \         ['fileformat', 'fileencoding', 'filetype', 'syntastic']
            \     ]
            \ },
            \ 'component': {
            \     'paste': '%{&paste?"!":""}',
            \     'buffer_name': '%F', 
            \     'max_line': '%L', 
            \ },
            \ 'component_function': {
            \     'mode'         : 'MyMode',
            \     'fugitive'     : 'MyFugitive',
            \     'readonly'     : 'MyReadonly',
            \     'ctrlpmark'    : 'CtrlPMark',
            \     'bufferline'   : 'MyBufferline',
            \     'fileformat'   : 'MyFileformat',
            \     'fileencoding' : 'MyFileencoding',
            \     'filetype'     : 'MyFiletype'
            \ },
            \ 'component_expand': {
            \     'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \     'syntastic': 'middle',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

let g:lightline.mode_map = {
            \ 'n'      : ' N ',
            \ 'i'      : ' I ',
            \ 'R'      : ' R ',
            \ 'v'      : ' V ',
            \ 'V'      : 'V-L',
            \ 'c'      : ' C ',
            \ "\<C-v>" : 'V-B',
            \ 's'      : ' S ',
            \ 'S'      : 'S-L',
            \ "\<C-s>" : 'S-B',
            \ '?'      : '      ' }

function! MyMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyFugitive()
    try
        if expand('%:t') !~? 'Tagbar' && exists('*fugitive#head')
            let mark = '∓ '
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! MyReadonly()
    return &ft !~? 'help' && &readonly ? '≠' : '' " or ⭤
endfunction

function! MyFileformat()
    return winwidth('.') > 90 ? &fileformat : ''
endfunction

function! MyFileencoding()
    return winwidth('.') > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.java,*.c,*.cpp,*.perl,*.py call s:syntastic()
augroup END

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction
" }

" }

" GUI Settings {
set lines=999
set columns=999

" GVIM- (here instead of .gvimrc)
if has('gui_running')
    set guioptions-=T			" Remove the toolbar
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi       " Make arrow and other keys work
endif

" }

" Functions {

" Initialize directories {
function! InitializeDirectories()
    let parent = $HOME
    let prefix = 'vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = $HOME . '/.vim/'

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction

call InitializeDirectories()
" }

" Initialize NERDTree as needed {
function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction
" }

" Strip whitespace {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }

" Shell command {
function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
" }

function! CursorPosition(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! NumberToggle()
    if(&relativenumber == 1)
        set relativenumber!
        set number
    else
        set relativenumber
    endif
endfunction

function! Fullscreen()
    call system("wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz")
endfunction

function! ClearUniteMRU()
    call system("rm -rf " . g:unite_data_directory . "/file_mru ")
    call system("touch " . g:unite_data_directory . "/file_mru ")

    call system("rm -rf " . g:unite_data_directory . "/directory_mru ")
    call system("touch " . g:unite_data_directory . "/directory_mru ")

    s:mru#validate()
endfunction

" }

