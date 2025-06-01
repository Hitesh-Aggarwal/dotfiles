# XDG paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

# Neovim as the editor
export EDITOR='nvim'

# Set bat theme and set bat as manpager
export BAT_THEME="OneHalfDark"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Default options for fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Change Inputrc location
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# Ledger file
export LEDGER_FILE="$HOME/ledger/ledger.ldg"

# function that adds a directory to path if it is not already present.
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

pathadd "$HOME/.local/bin"

# if running bash source .bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
