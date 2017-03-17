" 画面表示
set nonumber    " 行番号を非表示
set cursorline    " カーソル行の背景色を変更
"set nocursorcolumn    " カーソル位置のカラムの背景色を変更
set laststatus=2    " ステータス行を常に表示
"set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P    " ステータス行に表示させる情報
set title    " ウィンドウのタイトルに情報を表示
set ruler    " カーソルの位置情報をステータスに表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch    " 対応する括弧を強調表示
set helpheight=999    " ヘルプを全画面で表示
set list    " 不可視文字を表示
set listchars=tab:▸\ ,eol:↲    " 不可視文字の表示記号を指定
set showmatch " 括弧の対応関係を表示
set completeopt=menuone " 候補が1つしかないときもポップアップメニューを使用

hi Pmenu ctermbg=darkcyan ctermfg=white
hi PmenuSel ctermbg=brown ctermfg=black
hi PmenuSbar ctermbg=black
hi PmenuThumb cterm=reverse ctermfg=gray