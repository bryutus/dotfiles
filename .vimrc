" Environment
set encoding=utf-8
set clipboard=unnamed,unnamedplus
set mouse=a
set visualbell t_vb=
set noerrorbells
set backspace=indent,eol,start

" File
set confirm
set hidden
set autoread
set nobackup

" indent
set shiftwidth=4
set autoindent
set smartindent

syntax enable
filetype plugin indent on

" Screen
set number
set laststatus=2
set title
set ruler
set cmdheight=2
set showmatch
set helpheight=999
set list
set listchars=tab:▸\ ,eol:↲
set showmatch
set completeopt=menuone

hi Pmenu ctermbg=darkcyan ctermfg=white
hi PmenuSel ctermbg=brown ctermfg=black
hi PmenuSbar ctermbg=black
hi PmenuThumb cterm=reverse ctermfg=gray

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

" Tab
set expandtab
set tabstop=4
set softtabstop=4

if !&compatible
  set nocompatible
endif

" default path
let s:dein_dir = expand('~/.vim/dein')

" dein repository directory:
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if there is no dein.vim, to clone from GitHub
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" start setting
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " location of toml files
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " read the toml files and cache
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end setting
  call dein#end()
  call dein#save_state()
endif

" check non-install
if dein#check_install()
  call dein#install()
endif

" Plugins
"" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
cnoremap tree NERDTreeToggle

"" vim-trailing-whitespace
autocmd BufWritePre * :FixWhitespace

"" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "s",
    \ "Untracked" : "?",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "~",
    \ "Deleted"   : "d",
    \ "Dirty"     : "*",
    \ "Clean"     : "c",
    \ "Unknown"   : "?"
    \ }

"" vim-go
let g:go_fmt_command = "goimports"
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1

cnoremap godoc GoDoc
cnoremap godef GoDef
cnoremap gorun GoRun
cnoremap golint GoLint

"" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"


" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For golang.vim setting.
let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'
