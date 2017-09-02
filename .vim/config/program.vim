" プログラム

syntax enable    " シンタックスハイライトを有効
filetype plugin indent on    " ファイルタイプの自動検出、ファイルタイプ用の プラグインとインデント設定 を自動読み込み

" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=white ctermbg=darkblue
highlight DiffDelete cterm=bold ctermfg=white ctermbg=darkmagenta
highlight DiffChange cterm=bold ctermfg=white ctermbg=darkcyan
highlight DiffText   cterm=bold ctermfg=white ctermbg=red
