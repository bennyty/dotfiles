fish_hybrid_key_bindings

set -x EDITOR /usr/local/bin/nvim
set -x LESS "j.5"

alias ls=exa
alias la="exa -a"
alias ll="exa --all --long --git"
alias lst2='exa -l -T -L 2 --header --git-ignore -F -d -B --color-scale'
alias ef='$EDITOR ~/.config/fish/config.fish'
alias vim='nvim'
alias gst='git status'
alias dirs='cdh'
alias dip="docker inspect -f '{{.NetworkSettings.IPAddress}}'"

bind -M insert \cd expand_glob

source ~/.iterm2_shell_integration.(basename $SHELL)
bass source ~/.profile
