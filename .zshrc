# Line configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory extendedglob notify
unsetopt nomatch
bindkey -v
bindkey '^R' history-incremental-search-backward

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#403f4c,underline"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
#End of lines added by compinstall
autoload -U colors && colors

autoload -Uz vcs_info
precmd() { vcs_info }

EDITOR='vim'

setopt promptsubst

zstyle ":vcs_info:git:*" formats '%b - %r/%S'

local SSH_HOST USER_TYPE USER_PROMPT CURRENT_DIR RETURN_CODE

RETURN_CODE="%(?..%F{red}%? %{$reset_color%})"

if [[ $UID -ne 0 ]]; then
    USER_TYPE="%B%F{green}$%b"
else
    USER_TYPE="%B%F{red}#%b"
fi

if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    SSH_HOST="%F{cyan}%M%f" # SSH
else
    SSH_HOST="%F{red}%M%f" # NO SSH
fi

CURRENT_DIR="%B%F{blue}%~%f%b"

PROMPT='${USER_TYPE} ${SSH_HOST} ${CURRENT_DIR} %B%F{yellow}${vcs_info_msg_0_}%f%b
%F{yellow}>>%f '
RPROMPT='%B${RETURN_CODE}%b'

# aliases

alias ip='ip -color=auto'
alias l='ls -lha'
alias ls='ls --color=auto'
alias perfreport='perf report --call-graph=graph,caller'

alias vim='vim -T xterm_256color'
alias vimdiff='vimdiff -T xterm_256color'
alias vimu='vim -u NONE'
alias vimsum='vim gcc/testsuite/gcc/gcc.sum'
alias vimlog='vim gcc/testsuite/gcc/gcc.log'
alias vimsumpp='vim gcc/testsuite/g++/g++.sum'
alias vimlogpp='vim gcc/testsuite/g++/g++.log'

alias venv='python3 -m virtualenv venv && source ./venv/bin/activate'
alias less='less -r'
alias clera=clear

function isfile() {
    [[ -n "${1}" ]] && ([[ -f "${1}" ]] && echo 'Yes' || echo 'No') || echo 'Expected file name';
}

function isdir() {
    [[ -n "${1}" ]] && ([[ -d "${1}" ]] && echo 'Yes' || echo 'No') || echo 'Expected dir name';
}

export PATH=/home/dhruvc/usr/bin:$PATH

source ~/GIT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

