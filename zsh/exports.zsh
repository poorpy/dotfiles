#!/bin/env zsh

# export EDITOR='nvr --remote -s'
export EDITOR='nvim'
export READER='zathura'

export PATH="$PATH:$HOME/.bin:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cabal/bin:$PATH"


export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export GOPATH=$HOME/.go
export GOBIN=$HOME/.gobin
export PATH=$PATH:$GOBIN:$GOPATH/bin

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${PATH}:${SONAR_SCANNER_HOME}/bin"
