# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILE=$HOME/.cache/bash_history
HISTSIZE=10000
HISTFILESIZE=50000

# verify the history expansion before execution
shopt -s histverify

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Enable extended globbing
shopt -s extglob

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Disable freezing of terminal with ctrl-s
stty -ixon

# Set the prompt
PS1='\[\e[91;1m\][\[\e[93m\]\u\[\e[22m\]@\[\e[96;1m\]\h\[\e[0m\] \[\e[95m\]\w\[\e[91;1m\]]\[\e[0m\]\$ '

eval "$(zoxide init bash)"
