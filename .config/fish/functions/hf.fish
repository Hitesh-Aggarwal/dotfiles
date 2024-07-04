function of
    set -l var (fd --hidden --follow --type f --color=never | fzf)
    if file $var | rg -q 'text'
        $EDITOR $var
    else
        xdg-open $var > /dev/null &; disown
    end
end
