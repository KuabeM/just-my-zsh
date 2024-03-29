#!/bin/zsh

##
# Key bindings
#
# Anywhere:
#     Enter  -- Accept command line.
#
# On the command line:
#        Tab -- Insert top completion.
#  Shift-Tab -- Insert bottom completion.
#       Down -- Enter completion menu to select another completion.
#         Up -- Open history menu.
#     Ctrl-R -- Toggle between completion and history search.
#
# In any menu:
# Arrow Keys -- Change selection.
#        Tab -- Accept selection and return to command line.
#
# In the completion menu:
#     Ctrl-S -- Start full-text search.
#
# In full-text search:
#     Ctrl-S -- Go to next match.
#     Ctrl-R -- Go to previous match
#        Tab -- Exit search and return to completion menu.
# Arrow Keys -- Exit search and return to completion menu.
#

# Enable the use of Ctrl-Q and Ctrl-S for keyboard shortcuts.
unsetopt FLOW_CONTROL

# Alt-H: Get help on your current command.
() {
  unalias $1 2> /dev/null   # Remove the default.

  # Load the more advanced version.
  # +X loads the function immediately, so we can access the source dir.
  autoload -Uz +X $1

  # Load the hash table that maps each function to its source file.
  zmodload -F zsh/parameter p:functions_source

  # Lazy-load all the run-help-* helper functions from the same dir.
  autoload -Uz $functions_source[$1]-*~*.zwc  # Exclude .zwc files.
} run-help

# Use emacs key bindings
bindkey -e

# [Alt-Q]
# - On the main prompt: Push aside your current command line  so you can type a
#   new one. The old command line is restored when you press Alt-G or once
#   you've accepted the new command line.
# - On the continuation prompt: Return to the main prompt.
bindkey '^[q' push-line-or-edit

# [Alt-V] Show the next key combo's terminal code and state what it does.
bindkey '^[v' describe-key-briefly

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey 'C-e' edit-command-line

# Enter interactive menu
bindkey -M menuselect '^xi' vi-insert

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

bindkey "${terminfo[kcbt]}" reverse-menu-complete

