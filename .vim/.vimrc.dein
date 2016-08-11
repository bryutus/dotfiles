" dein.vim

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
