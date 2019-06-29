# Environment variable
export LANG=ja_JP.UTF-8
export KCODE=u
export PATH=/usr/local/bin:$PATH

# GOPATH
export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin

autoload -Uz colors
colors

PROMPT="%11F%n%f:%10F%m%f \$ "
RPROMPT=$'`branch-status-check` %~'

setopt prompt_subst
autoload -U colors; colors

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

setopt print_eight_bit

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt interactive_comments

setopt auto_cd
setopt auto_pushd
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
alias history='history -Di -E 1'

bindkey '^]' peco-src

function branch-status-check {
    local prefix branchname suffix
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status`
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}

function get-branch-name {
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
        echo ${color}
}

function peco-src() {
    local src=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi
    zle -R -c
}
zle -N peco-src
