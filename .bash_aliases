# enable color support of ls and also add handy aliases
alias ls='eza --group-directories-first --icons'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'
alias ll='ls -al'
alias diff='diff --color=auto'
alias u='sudo apt update && sudo apt upgrade'
alias vi='nvim --clean'
alias vim='nvim'
alias lg='lazygit'
alias o='cd "$(fdfind --type d --color=never | fzf)"'
alias h='cd "$(fdfind --type d --hidden --color=never | fzf)"'
alias stow='stow --target=${HOME} -v'
alias mv='mv -i'

pcsv() {
    batcat --line-range :$2 --color=always -pp "$1" | column -t -s,
}

of() {
    local var="$(fdfind --type f --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}

hf() {
    local var="$(fdfind --hidden --type f --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}
