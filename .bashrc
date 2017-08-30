#
# ~/.bashrc
# BPMcKenna
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
fi #sets window title

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
alias cls='clear' #old dos habit
alias lynx='elinks'
alias ssr='sudo systemctl restart' #easily restart a service
alias ds="du -aSh 2>/dev/null | sort -hr | head -n 25" #what is taking up space?
alias ssa='eval `ssh-agent` && ssh-add'
alias cwd='printf "%q\n" "$(pwd)"' #shell-format pwd
alias ed='ed -p:' #ed's command prompt is :
alias ps?='ps alx | grep -v "grep" | grep' #bsd format ps search

### apt aliases ###
alias sagu='sudo apt-get update && sudo apt-get upgrade' #I'm lazy
alias acs='apt-cache search' #what's that package called?
alias agi='sudo apt-get install' #ah, that's the one
alias acp='apt-policy'



### git aliases ###
alias ga='git add --patch' #doesn't work for initial commit of a file, need to use "git add"
alias gax='git reset HEAD' #unstage a file easily
alias gco='git checkout'
alias gb='git branch'
alias gdu='git diff'       #what are the unstaged changes?
alias gd='git status -v'   #what are the staged changes?
alias gcm='git commit -m'
alias gs='git status'
alias gl='git plog'        #pretty log format
alias gp='git pull'
alias gpom='git push origin master'
alias gnew='git plog HEAD@{1}..HEAD@{0}' #see only latest commit

### svn aliases ###
alias sup='svn update'
alias scm='svn commit -m'
alias sxm='svn propedit --revprop svn:log -r'

### git-svn aliases ###
alias gsf='git svn fetch'
alias gsr='git svn rebase'
#alias gsc='git rebase -i git-svn' #clean up commits
#alias gsd='git svn dcommit'
alias gsd='git rebase -i git-svn && git svn dcommit' #clean up commits, and then push to SVN

### tmux aliases ###
alias tml='tmux list-sessions'
#alias tma='tmux attach-session -t'
alias tma='tmux new-session -As'
if [ -f /etc/bash_completion.d/tma ]; then
    . /etc/bash_completion.d/tma
fi


### functions ###

function up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; } #up 4 goes up 4 directories

#alias wtf='cat /etc/*-release && hostname && whoami && pwd'
function wtf() {
    printf "\n$USER @ $HOSTNAME running $OS" && uname -mrs;
    printf "Home directory: "$HOME"\n";
    printf "Current directory: "$PWD"\n";
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

function firefox() { command firefox "$@" & } #run firefox in background

#### EXPERIMENTAL ####

function mkscript(){
    name=$1
    touch $name.sh

    echo "#!`which bash`"
    echo "set -eu #safety line"
    echo "#$name.sh - written by bpm"

    chmod +x $name.sh
}

###SSH-AGENT###

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "$SSH_ENV" > /dev/null
    /usr/bin/ssh-add;
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} #doesn't work under cygwin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
