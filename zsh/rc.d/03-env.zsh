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
    $HOME/.local/share/fnm(N)
    $HOME/repos/robotx/utils/scripts(N)
    /opt/gcc-arm-none-eabi-9/bin(N)
    $path
)

# Add your functions to your $fpath, so you can autoload them.
fpath=(
    $ZDOTDIR/functions
    $fpath
    $ZDOTDIR/completions
    $ZDOTDIR/completions/zsh-completions/src
)

autoload -U compinit
compinit

# Set $PAGER if it hasn't been set yet. We need it below.
# `:` is a builtin command that does nothing. We use it here to stop Zsh from
# evaluating the value of our $expansion as a command.
: ${PAGER:=less -R}
export PAGER='less -R'

# CMake/Make use all cores
export -U CMAKE_BUILD_PARALLEL_LEVEL=8
export -U MAKEFLAGS='-j 8'
# LSP cmake compile commands
export -U CMAKE_EXPORT_COMPILE_COMMANDS=1

export -U GTEST_COLOR=1
# Editor
export -U EDITOR=vim

# Gnome ssh agent integration
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#export $(gnome-keyring-daemon --daemonize --start)

# Cabal and ghcup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Nodejs version manager, alternative to nvm
eval "`fnm env`"

source /opt/ros/galactic/setup.zsh

export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=/opt/aarch64-unknown-linux-gnu-9/bin/aarch64-linux-gnu-gcc
export CC_aarch64_unknown_linux_gnu=/opt/aarch64-unknown-linux-gnu-9/bin/aarch64-linux-gnu-gcc
