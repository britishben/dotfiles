#Ben's .zshrc
#I'm new to ZSH, so this will be pretty basic / not work at all
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory autocd nomatch
unsetopt beep notify
bindkey -v
alias vz='vi ~/.zshrc'
alias rz='source ~/.zshrc'
PS1="%n@%m(%l):%1~ %# "
