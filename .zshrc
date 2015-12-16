#Ben's .zshrc
#I'm new to ZSH, so this will be pretty basic / not work at all
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory autocd nomatch
unsetopt beep notify
bindkey -v
#alias vz = "vi ~/.zshrc"
PS1="%n@%m(%l):%~ %#"
