# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='eza --group-directories-first --icons -T --level=1'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias tree='tree -C'
fi
alias ll='ls -al'
alias diff='diff --color=auto'
alias u='sudo apt update && sudo apt upgrade'
alias vi='nvim --clean'
alias vim='nvim'
alias lg='lazygit'
alias rm='rm -i'
alias o='cd "$(fd --type d --color=never | fzf)"'
alias h='cd "$(fd --type d --hidden --color=never | fzf)"'
alias stow='stow --target=${HOME} -v'
alias mv='mv -i'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

pcsv() {
    bat --line-range :$2 --color=always -pp "$1" | column -t -s,
}

of() {
    local var="$(fd --type f --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}

hf() {
    local var="$(fd --hidden --type f --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}

man(){
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[40;93m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[4;93m' \
        command man "$@"
}
