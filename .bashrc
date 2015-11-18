#
# ~/.bashrc
# BPMcKenna
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ ' #basic prompt, make fancy later.
PS1='\u@\h on \l\n\d \t \$ '

### options ###
export GREP_OPTIONS='--color=auto'
alias ls='ls --color=auto' #I'm counting this as an option, it really should be
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTCONTROL=ignoredups  #ignore duplicates
export HISTIGNORE=ls:pwd:exit:clear:cls
export LESS="-iMFXR" # ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export EDITOR=vim
shopt -s checkwinsize

### aliases ###
alias vb='vim ~/.bashrc'
alias rm='rm -iv' # safety first!
alias cp='cp -v'
alias mv='mv -v'
alias ssr='sudo systemctl restart'

### git aliases ###
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gl='git plog'

### useful things I found, not really tested yet ###
alias diskspace="du -S | sort -n -r | more"
alias bd='cd - && pwd'
alias wtf='hostname && cat /etc/*-release && whoami && pwd'
#alias screenshot='import -window root ~/Desktop/`date +%Y%m%d%H%M`.png'

up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; } #up 4 goes up 4 directories

#if [ -f ~/.git-prompt.sh ]
#    then
#    source ~/.git-prompt.sh
#    export GIT_PS1_SHOWDIRTYSTATE=true
#    export PS1='[\u@\h(\l) \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$'
    #else
    #echo "Getting git-prompt.sh"
    #curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#fi

