#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ls alias
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'
alias laa='ls -lha'
alias lll='ls -lha'

# trash cli alias
alias rm='trash-put'

# rutas
alias cdp='cd ~/usr/prac'
alias cds='cd ~/usr/src'

# otros
alias cls='clear'
alias xo='xdg-open'
alias gvim='gvim 2>/dev/null'

# Variables
PS1='[\u@\h \W]\$ '
# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
# >>>>>END ADDED BY CNCHI INSTALLER<<<<< #

#source ~/.bash-powerline.sh
function _update_ps1() {
    PS1="$(/home/erithen/usr/powerline-shell/powerline-shell.py --cwd-max-depth 3 $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# PATHS
export PATH="${PATH}:/home/erithen/usr/bin:/home/erithen/usr/scripts"
