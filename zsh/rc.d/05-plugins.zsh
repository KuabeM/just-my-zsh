##
# Plugins
#

# Add the plugins you want to use here.
# For more info each plugin, visit its repo on github.com/<plugin>
plugins=(
  #marlonrichert/zsh-autocomplete      # Real-time type-ahead completion
  #marlonrichert/zsh-edit              # Better keyboard shortcuts
  marlonrichert/zsh-hist              # Edit history from the command line.
  marlonrichert/zcolors               # Colors for completions and Git
  zsh-users/zsh-autosuggestions       # Inline suggestions
  zsh-users/zsh-syntax-highlighting   # Command-line syntax highlighting
  ael-code/zsh-colored-man-pages      # Colored manpages
  zsh-users/zsh-completions           # more completions
)

# zsh-autocomplete sends *a lot* of characters to your terminal. This is fine
# locally on modern machines, but if you're working through a slow ssh
# connection, you might want to add a slight delay before the autocompletion
# kicks in:
# zstyle ':autocomplete:*' min-delay 1.0  # seconds
#
# If your connection is VERY slow, then you might want to disable
# autocompletion completely and use only tab completion instead:
# zstyle ':autocomplete:*' async no


# Speed up the first startup by cloning all plugins in parallel.
# This won't clone plugins that we already have.
znap clone $plugins

# Load each plugin, one at a time.
for p in $plugins; do
  znap source $p
done

# manual plugins
source $gitdir/git/git.plugin.zsh

unset p plugins

# `znap eval <name> '<command>'` is like `eval "$( <command> )"` but with
# caching and compilation of <command>'s output, making it ~10 times faster.
#znap eval zcolors "zcolors ${(q)LS_COLORS}"  # Extra init code needed for zcolors.
#zcolors ${(q)LS_COLORS} >| $gitdir/zcolors/colors  # Extra init code needed for zcolors.
source $gitdir/zcolors/colors
