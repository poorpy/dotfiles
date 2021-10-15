#!/bin/env zsh

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias :q='exit'
alias cls='clear; ls'
alias cll='clear; ll'
alias gdb='gdb -quiet'


alias vimrc='cd ${HOME}/.files/nvim/; nvim init.vim; cd -; '
alias zshrc='cd ${HOME}/.files/zsh/; nvim zshrc; cd -; '
# alias ocm-env='source ~/venv-ocm-2/bin/activate; unset PYTHONPATH; source ~/.scripts/ocm-venv.zsh'
alias ocm-env='source ~/venvs/venv-ocm-2/bin/activate'
alias pns-env='source ~/venvs/venv-pns/bin/activate'
alias amg-doc='source ~/venvs/venv-amg-doc/bin/activate'
alias mini-env='source ~/venvs/venv-mini/bin/activate'
alias clipboard='xclip -selection clipboard'
alias primary='xclip -selection primary'
alias amgd='~/git/amg'
alias minid='cd ~/git/mini'
alias ssh='TERM=xterm-color ssh'
