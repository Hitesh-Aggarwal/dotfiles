# enable color support of ls and also add handy aliases
alias ls='eza --group-directories-first --icons'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'
alias ll='ls -al'
alias diff='diff --color=auto'
alias vi='nvim --clean'
alias vim='nvim'
alias lg='lazygit'
alias o='cd "$(fd --type d --follow --color=never | fzf)"'
alias h='cd "$(fd --type d --hidden --follow --color=never | fzf)"'
alias stow='stow --target=${HOME} -v'
alias mv='mv -i'
alias open='xdg-open'
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

pcsv() {
    bat --line-range :$2 --color=always -pp "$1" | column -t -s,
}

of() {
    local var="$(fd --type f --follow --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}

hf() {
    local var="$(fd --hidden --follow --type f --color=never | fzf)"
    if file "$var" | rg -q 'text'; then
        $EDITOR "$var"
    else
        (xdg-open "$var" &> /dev/null &)
    fi
}
