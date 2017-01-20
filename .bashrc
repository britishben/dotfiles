#
# ~/.bashrc
# BPMcKenna
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\u@\h(\l):\W \$ ' #basic prompt, make fancy later. 

### PATH ###
#PATH="$HOME/dotfiles/scripts:${PATH}"
#export PATH

### options ###
#export GREP_OPTIONS='--color=auto' #apparently deprecated
alias ls='ls --color=auto' #I'm counting this as an option, it really should be
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTCONTROL=ignoreboth  #ignore duplicates, and lines starting with space
export HISTIGNORE=ls:pwd:exit:clear:cls
export LESS="-iMFXR" # ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colours
export EDITOR=vim
export LANG="en_GB.utf8"
shopt -s checkwinsize

### aliases ###
alias vb='vim ~/.bashrc'
alias rb='source ~/.bashrc'
alias vc='vim ~/.conkyrc'
alias rm='rm -iv' # safety first!
alias cp='cp -v'
alias mv='mv -v'
alias bd='cd -' #undo a cd, basically
alias cls='clear' #old dos habit
alias lynx='elinks'
#alias suroot='sudo -i' #Ubuntu doesn't trust me, not that it should
alias ssr='sudo systemctl restart' #easily restart a service
alias ds="du -aSh 2>/dev/null | sort -h -r | head -n 25" #what is taking up space?
alias sagu='sudo apt-get update && sudo apt-get upgrade' #I'm lazy
alias ssa='eval `ssh-agent` && ssh-add'
alias cwd='printf "%q\n" "$(pwd)"' #shell-format pwd

function firefox() { command firefox "$@" & } #run firefox in background

function up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; } #up 4 goes up 4 directories

### git aliases ###
alias ga='git add --patch' #doesn't work for initial commit of a file, need to use "git add"
alias gax='git reset HEAD' #unstage a file easily
#alias gc='git commit'     #never really used, gcm is much easier
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gcm='git commit -m'
alias gs='git status'
alias gl='git plog'
alias gp='git pull'
alias gpom='git push origin master'
alias gnew='git plog HEAD@{1}..HEAD@{0}'

### svn aliases ###
alias sup='svn update'

### git-svn aliases ###
alias gsf='git svn fetch'
alias gsr='git svn rebase'
#alias gsc='git rebase -i git-svn' #clean up commits
#alias gsd='git svn dcommit'
alias gsd='git rebase -i git-svn && git svn dcommit' #clean up commits, and then push to SVN

### tmux aliases ###
alias tml='tmux list-sessions'
alias tma='tmux attach-session -t'
if [ -f /etc/bash_completion.d/tma ]; then
    . /etc/bash_completion.d/tma
fi

#alias wtf='cat /etc/*-release && hostname && whoami && pwd'
function wtf() {
    printf "\n$USER @ $HOSTNAME running $OS" && uname -mrs;
    printf "Home directory: "$HOME"\n";
    printf "Current directory:"$PWD"\n";
    more /etc/*-rel* /etc/*_ver* | cat;
    printf "\n";
}

#extract most types of files
function extract() {
    if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2|*.tbz2)  tar xvjf $1     ;;
             *.tar.gz|*.tgz)    tar xvzf $1     ;;
             *.bz2)             bunzip2 $1      ;;
             *.rar)             unrar x $1      ;;
             *.gz)              gunzip $1       ;;
             *.tar)             tar xvf $1      ;;
             *.zip)             unzip $1        ;;
             *.Z)               uncompress $1   ;;
             *.7z)              7z x $1         ;;
             *.lzma)            unlzma $1       ;;
             *)                 echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file!"
     fi
}

#bookmark a directory
function mark() {
    export $1="`cwd`";
    printf "saved as $"$1"\n";
}
function unmark() {
    unset $1;
    printf "deleted $"$1"\n";
}
