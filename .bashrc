#
# ~/.bashrc
# BPMcKenna
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\u@\h(\l):\W \$ ' #basic prompt, make fancy later. 

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
alias vc='vim ~/.conkyrc'
alias rm='rm -iv' # safety first!
alias cp='cp -v'
alias mv='mv -v'
alias lynx='elinks'
alias suroot='sudo -i' #Ubuntu doesn't trust me
alias ssr='sudo systemctl restart' #easily restart a service

function firefox() { command firefox "$@" & } #run firefox in background

### git aliases ###
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gl='git plog'
alias gpom='git push origin master'

### useful things I found, not really tested yet ###
alias diskspace="du -S | sort -n -r | less"
alias bd='cd - && pwd'
alias wtf='hostname && cat /etc/*-release && whoami && pwd'
alias takescreen='import -window root ~/Desktop/`date +%Y%m%d%H%M`.png'

up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; } #up 4 goes up 4 directories

function extract()
{
    if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file!"
     fi
}
