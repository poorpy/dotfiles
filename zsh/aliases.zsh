#!/bin/env zsh

alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -l"
alias :q="exit"


alias vimrc="cd ${HOME}/.files/nvim/; nvim init.vim; cd -; "
alias zshrc="cd ${HOME}/.files/zsh/; nvim zshrc; cd -; "

alias clipboard="xclip -selection clipboard"
alias primary="xclip -selection primary"

alias vim="noglob vim"
alias ssh="noglob ssh"
alias gdb="gdb -quiet"
