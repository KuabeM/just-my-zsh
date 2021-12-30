#!/bin/zsh

##
# Environment variables
#

# -U ensures each entry in these is Unique (that is, discards duplicates).
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath  # -T creates a "tied" pair; see below.

# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# So, you can add elements to your $PATH (or $FPATH, etc.) like this:
path=(
    $HOME/.cargo/bin(N)
    $HOME/.local/bin(N)
    $HOME/.cabal/bin(N)
    $XDG_CONFIG_HOME/sway/scripts(N)
    $path
)

# Add your functions to your $fpath, so you can autoload them.
fpath=(
    $ZDOTDIR/functions
    $fpath
)

# Set $PAGER if it hasn't been set yet. We need it below.
# `:` is a builtin command that does nothing. We use it here to stop Zsh from
# evaluating the value of our $expansion as a command.
: ${PAGER:=less -R}
export PAGER='less -R'

# CMake use all cores
export -U CMAKE_BUILD_PARALLEL_LEVEL=8
# LSP cmake compile commands
export -U CMAKE_EXPORT_COMPILE_COMMANDS

export -U GTEST_COLOR=1
# Editor
export -U EDITOR=vim

# Gnome ssh agent integration
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#export $(gnome-keyring-daemon --daemonize --start)

# MC7 configuration
#export E2_CONFIG=$HOME/repos/mc7/e2.conf

# Cabal and ghcup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Nodejs version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
