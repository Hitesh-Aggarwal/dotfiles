if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    fish_vi_key_bindings
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursors to an underscore
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
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
    alias o='cd "$(fd --type d --color=never | fzf)"'
    alias h='cd "$(fd --type d --hidden --color=never | fzf)"'
    alias stow='stow --target=$HOME -v'
    alias mv='mv -i'
    alias btop='btop --utf-force'
    abbr --add dotdot --regex '^\.\.+$' --function multicd
    zoxide init fish | source
    fm6000 -r -c random
end
