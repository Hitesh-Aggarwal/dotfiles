# Neovim as the editor
export EDITOR='nvim'
export BAT_THEME='gruvbox-dark'
# Default options for fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

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
