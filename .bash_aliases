# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'
alias ll='ls -al'
alias diff='diff --color=auto'
alias vi='nvim --clean'
alias vim='nvim'
# alias lg='lazygit'
alias o='cd "$(fdfind --type d --follow --color=never | fzf)"'
alias h='cd "$(fdfind --type d --hidden --follow --color=never | fzf)"'
alias stow='stow --target=${HOME} -v'
alias mv='mv -i'
alias btop='btop --utf-force'
alias open='xdg-open'


encryptfile() {
    gpg -a --symmetric --cipher-algo AES256 "$1"
}

decryptfile() {
    gpg -a --output "${1%.asc}" --decrypt "$1"
}

pcsv() {
    batcat --line-range :$2 --color=always -pp "$1" | column -t -s,
}

of() {
    local var="$(fdfind --type f --follow --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}

hf() {
    local var="$(fdfind --hidden --follow --type f --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}
