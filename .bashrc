#
# ~/.bashrc
# BPMcKenna
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\u@\h(\l):\W \$ ' #basic prompt, make fancy later. 

### options ###
#export GREP_OPTIONS='--color=auto' #apparently deprecated
alias ls='ls --color=auto' #I'm counting this as an option, it really should be
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTCONTROL=ignoredups  #ignore duplicates
export HISTIGNORE=ls:pwd:exit:clear:cls
export LESS="-iMFXR" # ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colours
export EDITOR=vim
shopt -s checkwinsize

### aliases ###
alias vb='vim ~/.bashrc'
alias vc='vim ~/.conkyrc'
alias rm='rm -iv' # safety first!
alias cp='cp -v'
alias mv='mv -v'
alias bd='cd -' #undo a cd, basically
alias cls='clear' #old dos habit
alias lynx='elinks'
alias suroot='sudo -i' #Ubuntu doesn't trust me, not that it should
alias ssr='sudo systemctl restart' #easily restart a service
alias ds="du -Sh | sort -h -r | less" #what is taking up space?

function firefox() { command firefox "$@" & } #run firefox in background

function up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; } #up 4 goes up 4 directories

### git aliases ###
alias ga='git add --patch'
alias gax='git reset HEAD' #unstage a file easily
alias gc='git commit'
alias gd='git diff'
alias gcm='git commit -m'
alias gs='git status'
alias gl='git plog'
alias gp='git pull'
alias gpom='git push origin master'
alias gnew='git plog HEAD@{1}..HEAD@{0}'

### git-svn aliases ###
alias gsf='git svn fetch'
alias gsr='git svn rebase'
#alias gsc='git rebase -i git-svn' #clean up commits before I push them to the SVN
#alias gsd='git svn dcommit'
alias gsd='git rebase -i git-svn && git svn dcommit' #clean up commits, and then push to SVN

### useful things I found, not really tested yet ###
alias takescreen='import -window root ~/Desktop/`date +%Y%m%d%H%M`.png' #needs imagemagick, probably replace later

#alias wtf='cat /etc/*-release && hostname && whoami && pwd'
function wtf() {
    printf $USER"@"$HOSTNAME" running $OS(" && uname -mrs;
    printf ")\n";
    printf /etc/*-rel* /etc/*_ver*;
    cat /etc/*-rel* /etc/*_ver*;
    printf "\n";
    printf "Home directory: "$HOME;
    printf "Current directory:"$PWD;
}

#extract most types of files
function extract() {
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

#bookmark a directory
function mark() { 
    export $1=`pwd`;
}
