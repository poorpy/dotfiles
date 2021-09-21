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
alias ocm-env="source ~/venv-ocm/bin/activate"
alias clipboard='xclip -selection clipboard'
alias primary='xclip -selection primary'

alias tokiofmt="rustfmt --check --edition 2018 $(find . -name '*.rs' -print)"
alias tokiodoc='RUSTDOCFLAGS="--cfg docsrs" cargo +nightly doc --all-features'
