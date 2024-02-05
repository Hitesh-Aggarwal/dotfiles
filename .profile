# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

# Run firefox natively on wayland.
export MOZ_ENABLE_WAYLAND=1

# Neovim as the editor
export EDITOR='nvim'

# Default options for fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# fix locale warning in nix applications
export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"

# use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# function that adds a directory to path if it is not already present.
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

pathadd "/usr/sbin"
pathadd "$HOME/bin"
pathadd "$HOME/.local/bin"

# if running bash source .bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -e /home/hitesh/.nix-profile/etc/profile.d/nix.sh ]; then . /home/hitesh/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
