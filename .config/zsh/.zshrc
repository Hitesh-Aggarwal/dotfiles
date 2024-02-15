setopt extendedglob
setopt histverify
setopt menucomplete
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY
unsetopt beep
bindkey -v

HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=100000

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

if [ -f $ZDOTDIR/catppuccin_macchiato-zsh-syntax-highlighting.zsh ]; then
    . $ZDOTDIR/catppuccin_macchiato-zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
