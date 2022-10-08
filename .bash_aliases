export EDITOR='nvim'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

alias ls='exa -lhF --icons --color=auto --group-directories-first'
alias u='sudo apt update && sudo apt upgrade -y'
alias btop='btop --utf-force'
alias v='nvim'
alias vim='nvim'
alias fm6000='fm6000 -random -c "random"'
alias lg='lazygit'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

o() {
  local var=$(fdfind | fzf)
  if file "$var" | rg -q 'text'; then
    $EDITOR "$var"
  elif [[ -d "$var" ]]; then
    cd "$var"
  elif [[ -f "$var" ]]; then
    (xdg-open "$var" &> /dev/null &)
  fi
}

h() {
  local var=$(fdfind --hidden | fzf)
  if file "$var" | rg -q 'text'; then
    $EDITOR "$var"
  elif [[ -d "$var" ]]; then
    cd "$var"
  elif [[ -f "$var" ]]; then
    (xdg-open "$var" &> /dev/null &)
  fi
}

