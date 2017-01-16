#Ben's .zshrc
#I'm new to ZSH, so this will be pretty basic / not work at all

PS1="%n@%m(%l):%1~ %# "

### options ###
alias ls='ls --color=auto' #I'm counting this as an option, it really should be
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory autocd nomatch
unsetopt beep notify
bindkey -v
alias vz='vi ~/.zshrc'
alias rz='source ~/.zshrc'
LESS="-iMFXR" # ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colours
EDITOR=vim
LANG="en_GB.utf8"

#my aliases from bash
alias rm='rm -iv' # safety first!
alias cp='cp -v'
alias mv='mv -v'
alias bd='cd -' #undo a cd, basically
alias cls='clear' #old dos habit
alias lynx='elinks'
alias ssr='sudo systemctl restart' #easily restart a service
alias ds="du -Sh 2>/dev/null | sort -h -r | head -n 25" #what is taking up space?
alias sagu='sudo apt-get update && sudo apt-get upgrade' #I'm lazy

function up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; } #up 4 goes up 4 directories
