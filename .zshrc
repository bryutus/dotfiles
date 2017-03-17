# 環境変数
export LANG=ja_JP.UTF-8
export KCODE=u # KCODEにUTF-8を設定

# GOPATH
export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin

# 色
autoload -Uz colors
colors

# プロンプト
PROMPT="[%n@%m]
$ "
RPROMPT=$'`branch-status-check` %~'
setopt prompt_subst


# 補完機能
autoload -Uz compinit
compinit

# タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# タブでパス名の補完候補を表示したあと、続けてタブを押すと候補からパス名を選択できる
zstyle ':completion:*:default' menu select=1

# 日本語ファイルを表示可能に
setopt print_eight_bit

# ヒストリーの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# zshの間でヒストリーを共有
setopt share_history

# 同じコマンドをヒストリーに残さない
setopt hist_ignore_all_dups

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除
setopt hist_reduce_blanks

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcd
setopt auto_cd

# cd したら自動的にpushd
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# alias
alias ls='ls -GF'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lah'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias vi='vim'

alias history='history -Di'


# methods for RPROMPT
autoload -U colors; colors

function branch-status-check {
    local prefix branchname suffix
        # .gitの中のため除外
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        # ブランチ名が無いため除外
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status`
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}

function get-branch-name {
    # gitディレクトリでない場合のエラーは捨てる
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}

function get-branch-status {
    local res color
        output=`git status --short 2> /dev/null`
        if [ -z "$output" ]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ $output =~ "[\n]?\?\? " ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ $output =~ "[\n]? M " ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        echo ${color} # 色だけ返す
}
