# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ..='cd ..'
alias dc='cd'
alias gs='git status'
alias open='xdg-open'

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

eval "$(fzf --bash)"

bind -x '"\ef": "tmux-sessionizer"'

export PATH=$PATH:/usr/local/go/bin:/home/petrside/.local/bin

. "$HOME/.cargo/env"
