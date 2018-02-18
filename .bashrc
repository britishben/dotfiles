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
export GOPATH="$HOME/go"
#export PATH="$HOME/dotfiles/scripts:${PATH}:$GOPATH/bin"

### options ###
#export GREP_OPTIONS='--color=auto' #apparently deprecated
alias ls='ls --color=auto' #I'm counting this as an option, it really should be
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTTIMEFORMAT="%F %T(%Z) "
export HISTCONTROL=ignoreboth  #ignore duplicates, and lines starting with space
export HISTIGNORE=ls:pwd:exit:clear:cls
export LESS="-iMFXR" # ignore case, long prompt, exit if it fits on one screen, don't clear on quit, allow colors
export EDITOR=vim
export LANG="en_GB.utf8"
shopt -s checkwinsize

### aliases ###
alias vb='vim ~/.bashrc'
alias rb='source ~/.bashrc'
alias vv='vim ~/.vimrc'
alias vc='vim ~/.conkyrc'
alias rm='rm -iv' # safety first!
alias cp='cp -v'
alias mv='mv -v'
alias cls='clear' #old dos habit
alias lynx='elinks'
alias ssr='sudo systemctl restart' #easily restart a service
alias ds="du -aSh 2>/dev/null | sort -hr | head -n 25" #what is taking up space?
#alias ssa='eval `ssh-agent` && ssh-add'
alias cwd='printf "%q\n" "$PWD"' #shell-format pwd
alias ed='ed -p:' #ed's command prompt is :
alias ps\?='ps alx | grep -v "grep" | grep' #bsd format ps search
alias pls='sudo $(history -p \!\!)'

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

### go aliases ###
function gocd() { cd "$(go list -f '{{.Dir}}' "$1")"; }

### functions ###

function up() { cd "$(printf '../'%.0s $(seq 1 $1))" && pwd; } #up 4 goes up 4 directories

#alias wtf='cat /etc/*-release && hostname && whoami && pwd'
function wtf() {
    echo
    echo "$USER @ $HOSTNAME running $OS" && uname -mrs
    echo "Home directory: $HOME"
    echo "Current directory: $PWD"
    more /etc/*-rel* /etc/*_ver* /etc/issue | cat
    echo
}

#extract most types of files based on extension
function extract() {
    programs="tar lzip xz bzip2 lbzip2 pbzip2 gzip pigz plzip unrar unlzma unzip uncompress 7z"
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.gz|*.tgz|*.taz)
                if [ -x "$(command -v pigz)" ]; then
                    tar -I=pigz -xvf "$1"
                else
                    tar -xvzf "$1";
                fi  ;;
            *.tar.bz2|*.tz2|*.tbz2|*.tbz)
                if [ -x "$(command -v lbzip2)" ]; then
                    tar -I=lbzip2 -xvf "$1"
                elif [ -x "$(command -v pbzip2)" ]; then
                    tar -I=pbzip2 -xvf "$1"
                else
                    tar -xvjf "$1"
                fi  ;;
            *.tar.Z|*.taZ)                 tar -xvZf "$1"          ;;
            *.tar.xz|*.txz)                tar -xvJf "$1"          ;;
            *.tar.lzma|*.tlz)              tar --lzma -xvf "$1"    ;;
            *.tar.lzop)                    tar --lzop -xvf "$1"    ;;
            *.tar.lz)
                if [ -x "$(command -v plzip)" ]; then
                    tar -I=plzip -xvf "$1"
                else
                    tar --lzip xvf "$1"
                fi  ;;
            *.tar)   tar -xvf "$1"
                ;;
                ## done with tar options ##

            *.gz)
                if [ -x "$(command -v pigz)" ]; then
                    pigz -d "$1"
                else
                    gzip -d "$1"
                fi  ;;
            *.bz2)
                if [ -x "$(command -v lbzip2)" ]; then
                    lbzip2 -d "$1"
                elif [ -x "$(command -v pbzip2)" ]; then
                    pbzip2 -d "$1"
                else
                    bzip2 -d "$1"
                fi ;;
            *.rar)   unrar x "$1"     ;;
            *.lzma)  unlzma "$1"      ;;
            *.xz)    unxz "$1"        ;;
            *.zip)   unzip "$1"       ;;
            *.7z)    7z x "$1"        ;;
            *.Z)     uncompress "$1"  ;;
            *)       echo "'$1' cannot be extracted via >extract<" ;;
        esac
    elif [ "$1" = "help" ]; then
        #type -a $programs
        for p in $programs; do
            printf "%s: " "$p"
            if [ "$(command -v "$p")" ]; then
                readlink -f "$(command -v "$p")"
            else
                echo "Not Found"
            fi
        done
    else
        echo "'$1' is not a valid filename"
    fi
}

#bookmark a directory
function mark() {
    export "$1"="$(printf '%q' "$PWD")"
    printf 'saved as $%s\n' "$1"
}
function unmark() {
    unset "$1"
    printf 'deleted $%s\n' "$1"
}

#unroll a link
function unroll(){
    local FILE="$1"

    while
        echo "$FILE"
        [ -L "$FILE" ]
        FILE=$(readlink "$FILE")
    do continue; #do-while loop
    done
}

#list files with trailing whitespace
function wsc(){
    grep --binary-files=without-match -crP '\s+$' -- | \
        grep -v ':0$' | grep -v '.git/' | \
        awk -F':' '{print $2":"$1}' | sort -nr
}

###SSH-AGENT###

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    printf "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo "succeeded"
    chmod 600 "${SSH_ENV}"
    source "${SSH_ENV}"
    /usr/bin/ssh-add;
}

: "${SSH_AGENT_PID:=$(pgrep ssh-agent)}"
if [ -z "${SSH_AUTH_SOCK}" ]; then
    if [ -f "${SSH_ENV}" ]; then
        source "${SSH_ENV}"
    fi
    if ! ( ps -q "${SSH_AGENT_PID:=$(pgrep ssh-agent)}" > /dev/null ); then
        start_agent;
    fi
fi

#### EXPERIMENTAL ####

function mkscript(){
    name="${1:-newscript}"
    touch "$name".sh

    cat > "$name.sh" << EOT
#!$(command -v bash)
set -euo pipefail #safety line

#$name.sh - written by bpm
#Generated by mkscript: $(date +'%F %T %Z')

VERSION=0.1.0
EOT

    if [ "${2:-false}" == "options" ]; then

        cat >> "$name.sh" << EOT
usage(){
    cat<<EOU
Usage: \$0 [options] <args>

Options:
    -h          Show this screen
    -v          Show version
    -i <arg>    First option
EOU

if [ \$# == 0 ] ; then
    usage
    exit 1;
fi

while getopts ":i:vh" optname
do
    case "\$optname" in
        "v")
            echo "$name.sh - version \$VERSION"
            exit 0;
            ;;
        "i")
            echo "-i argument: \$OPTARG"
            ;;
        "h")
            usage
            exit 0;
            ;;
        "?")
            echo "Unknown option \$OPTARG"
            exit 1;
            ;;
        ":")
            echo "No argument value for option \$OPTARG"
            exit 1;
            ;;
        *)
            echo "Unknown error while processing options"
            exit 1;
            ;;
    esac
done

shift \$((OPTIND - 1))

EOT
    fi

    chmod +x "$name".sh
    vi "$name".sh
}

###EOF###
