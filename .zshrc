source ~/.profile
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# export EDITOR='emacsclient -ct'
export EDITOR='vim'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="clean"
ZSH_THEME="ben"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root line pattern cursor)
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	fasd
	common-aliases
	npm
	fzf
	sudo
	brew
	brew-cask
	osx
	vi-mode
	zsh-syntax-highlighting
	fancy-ctrl-z
	git-flow-completion
	history-substring-search
	catimg
	wd)

# User configuration

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/Ben/.gem/ruby/2.0.0/bin:/Users/Ben/Library/Haskell/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias open.="open ."
alias fuck='$(thefuck $(fc -ln -1))'

#Explain https://www.mankier.com/blog/explaining-shell-commands-in-the-shell.html?hn=1
explain () {
	if [ "$#" -eq 0 ]; then
	while read  -p "Command: " cmd; do
		curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
	done
	echo "Bye!"
	elif [ "$#" -eq 1 ]; then
	curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
	else
	echo "Usage"
	echo "explain                  interactive mode."
	echo "explain 'cmd -o | ...'   one quoted command to explain it."
	fi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

### vi cursor {{{

function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2, doesn't work in tmux :(
    case $KEYMAP in
      vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
      viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    # Change prompt to show status
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    #zle reset-prompt


    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
# Modal cursor color for vi's insert/normal modes.
# http://stackoverflow.com/questions/30985436/
# https://bbs.archlinux.org/viewtopic.php?id=95078
# http://unix.stackexchange.com/questions/115009/
#zle-line-init () {
#  zle -K viins
#  #echo -ne "\033]12;Grey\007"
#  #echo -n 'grayline1'
#  echo -ne "\033]12;Gray\007"
#  echo -ne "\033[4 q"
#  #print 'did init' >/dev/pts/16
#}
#zle -N zle-line-init
#zle-keymap-select () {
#  if [[ $KEYMAP == vicmd ]]; then
#    if [[ -z $TMUX ]]; then
#      printf "\033]12;Green\007"
#      printf "\033[2 q"
#    else
#      printf "\033Ptmux;\033\033]12;red\007\033\\"
#      printf "\033Ptmux;\033\033[2 q\033\\"
#    fi
#  else
#    if [[ -z $TMUX ]]; then
#      printf "\033]12;Grey\007"
#      printf "\033[4 q"
#    else
#      printf "\033Ptmux;\033\033]12;grey\007\033\\"
#      printf "\033Ptmux;\033\033[4 q\033\\"
#    fi
#  fi
#  #print 'did select' >/dev/pts/16
#}
#zle -N zle-keymap-select
###}}}


export KEYTIMEOUT=1 #escape switches mode .1 seconds (down from .4)
NPM_PACKAGES=/Users/Ben/.npm-packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

#External aliases
source $HOME/.dotfiles/.aliases

#History Substring Search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#Todo.txt
export TODOTXT_DEFAULT_ACTION=ls
# Run todo on startup
# t

#FASD
eval "$(fasd --init auto)"

#gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# {{{
iosIconMake () {
    #!/bin/sh

    ITUNES_ARTWORK="$1"
    FOLDER=$(dirname "$ITUNES_ARTWORK")

    sips -z 57 57 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon.png"
    sips -z 114 114 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon@2x.png"
    sips -z 120 120 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-60@2x.png"
    sips -z 29 29 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-Small.png"
    sips -z 58 58 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-Small@2x.png"
    sips -z 40 40 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-Small-40.png"
    sips -z 80 80 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-Small-40@2x.png"
    sips -z 50 50 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-Small-50.png"
    sips -z 100 100 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-Small-50@2x.png"
    sips -z 72 72 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-72.png"
    sips -z 144 144 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-72@2x.png"
    sips -z 76 76 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-76.png"
    sips -z 152 152 "$ITUNES_ARTWORK" --out "${FOLDER}/Icon-76@2x.png"
}
# }}}


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
