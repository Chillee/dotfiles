export ZSH=/home/alex/.oh-my-zsh
export TERM="xterm-256color"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git command-not-found extract gitignore)

source $ZSH/oh-my-zsh.sh

# vi-like bindings
bindkey -v
bindkey -M vicmd v edit-command-line

# if neovim is installed, use it
if hash nvim 2>/dev/null; then
	alias vim=nvim
	export EDITOR=nvim
else
	export EDITOR=vim
fi

# use sudo with vim
alias svim="sudo -E $EDITOR"

# use curl as wget
wget() {
	curl -L "$1" -o "$(basename $1)"
}

# auto ls
chpwd() {
    emulate -L zsh
    ls
}

# open file with default program
alias o='exo-open'

# python console calculator
alias calc='python3 -ic "from math import *; import cmath"'

# shortcuts to edit config files
e() {
    case "$1" in
	keys)
	    vim $HOME/.config/sxhkd/sxhkdrc
	    ;;
	zsh)
	    vim "$HOME/.zshrc"
	    source "$HOME/.zshrc"
	    ;;
	zshenv)
	    vim "$HOME/.zshenv"
	    ;;
	bspwm)
	    vim $HOME/.config/bspwm/bspwmrc
	    ;;
	vim)
	    vim $HOME/.vimrc
	    ;;
	startup)
	    vim $HOME/.config/bspwm/startup.sh
	    ;;
	*)
	    echo "$1: invalid option"
	    return 1
	    ;;
    esac
}

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
