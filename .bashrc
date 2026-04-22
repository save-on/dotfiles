#
# ~/.bashrc
#
# If not running interactively, don't do anything


[[ $- != *i* ]] && return

eval $(dircolors ~/.dir_colors)

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/{\1}/'
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Terminal name
PS1='\[\e[38;2;18;224;176m\]\u\[\e[38;2;255;255;255m\]@\[\e[38;2;18;224;176m\]\h \[\e[38;2;255;255;255m\]\W\[\e[38;5;205m$(parse_git_branch)\[\e[38;2;255;255;255m >> '
