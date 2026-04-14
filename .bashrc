#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Terminal name
PS1='\[\e[38;2;18;224;176m\]\u\[\e[38;2;255;255;255m\]@\[\e[38;2;18;224;176m\]\h \[\e[0m\]\W >> '
