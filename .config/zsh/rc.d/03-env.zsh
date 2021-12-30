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
    /home/linuxbrew/.linuxbrew/bin(N)	# (N): null if file doesn't exist
    $path
)

# Add your functions to your $fpath, so you can autoload them.
fpath=(
    $ZDOTDIR/functions
    $fpath
)


# CMake use all cores
export -U CMAKE_BUILD_PARALLEL_LEVEL=8
export -U CMAKE_EXPORT_COMPILE_COMMANDS
export -U GTEST_COLOR=1
export -U EDITOR=vim
