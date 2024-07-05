" Environment
set encoding=utf-8
set clipboard=unnamed,unnamedplus
set mouse-=a
set visualbell t_vb=
set noerrorbells
set backspace=indent,eol,start

" File
set confirm
set hidden
set autoread
set nobackup

" Indent
set shiftwidth=2
set autoindent
set smartindent

" Syntax
syntax enable

" Screen
set number
set laststatus=2
set title
set ruler
set cmdheight=2
set showmatch
set list
set listchars=tab:▸\ ,eol:↲
set showmatch

" Highlight
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
set tabstop=2
set softtabstop=2
