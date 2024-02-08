# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

# Neovim as the editor
export EDITOR='nvim'

# Default options for fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# function that adds a directory to path if it is not already present.
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

# Add .local/bin to path
pathadd "$HOME/.local/bin"

# Add Nodejs to Path
pathadd "$HOME/apps/node-v20.11.0-linux-x64/bin"

# if running bash source .bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
