#!/bin/zsh

##
# Commands, funtions and aliases
#


# These aliases enable us to paste example code into the terminal without the
# shell complaining about the pasted prompt symbol.
alias %= \$=


# zmv lets you batch rename (or copy or link) files by using pattern matching.
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zmv
autoload -Uz zmv
alias zmv='zmv -Mv'
alias zcp='zmv -Cv'
alias zln='zmv -Lv'

# Note that, unlike Bash, there's no need to inform Zsh's completion system
# of your aliases. It will figure them out automatically.



# Associate file .extensions with programs.
# This lets you open a file just by typing its name and pressing enter.
# Note that the dot is implicit. So, `gz` below stands for files ending in .gz
alias -s {css,gradle,html,js,json,md,patch,properties,txt,xml,yml}=$PAGER
alias -s gz='gzip -l'
alias -s {log,out}='tail -F'


# Use `< file` to quickly view the contents of any file.
READNULLCMD=$PAGER  # Set the program to use for this.

# misc
alias vim="nvim"
alias batp="bat --plain"
alias tt="alacritty&!"
alias spotify="flatpak run com.spotify.Client"

alias reboot="echo 'Are you sure?' If so, run /sbin/reboot" 
alias shutdown="echo 'Are you sure?' If so, run /sbin/shutdown"

# sccache
#export RUSTC_WRAPPER=sccache

# color picker with grim
alias colorpick='grim -g "$(slurp -p)" -t ppm - | convert - -format "%[pixel:p{0,0}]" txt:-'

# fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide: smart cd
eval "$(zoxide init zsh)"
