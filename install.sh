#!/bin/zsh

cfgdir=$(pwd)

# Install zshenv
ln -nfs $cfgdir/zshenv $HOME/.zshenv

# Install zsh cfg folder
ln -nfs $cfgdir/zsh ${XDG_CONFIG_HOME:=~/.config}/zsh

# Install local git-alias plugin
ln -nfs $cfgdir/git-alias ~/.zsh-git/git
