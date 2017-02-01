#!/bin/bash
#slightly better, more automated install script. still not good though.

function homelink(){
    FILE=$1; shift;
    if [ -f ~/$FILE ]; then
        printf "File Exists! "
        if ! confirm $FILE; then
            return 0;
        fi
    fi
    echo "linking $FILE $1"
    ln -sfv "./$FILE" ~/$FILE
}

function confirm(){
   NAME=$1; shift;
   read -p "Would you like to install $NAME? (y/n): " VALUE
   if [[ $VALUE == 'y' ]]; then return 0;
   elif [[ $VALUE == 'q' ]]; then exit;
   else return 1;
   fi
}


# bash
if confirm bash; then
    homelink .bash_profile
    homelink .bashrc
fi

# zsh
if confirm zsh; then
    homelink .zshrc
fi

# tmux
if confirm tmux; then
    homelink .tmux.conf
   ln -sfv ./tma "/etc/bash_completion.d/tma"
fi

# git
if confirm git; then
    homelink .gitconfig
    homelink .gitignore
fi

# vim
if confirm vim; then
    homelink .vim folder
    homelink .vimrc
fi

# i3
if confirm i3; then
    homelink .i3 folder
fi

# conky
if confirm conky; then
    homelink .conkyrc
fi

# lxterm
if confirm lxterminal; then
    homelink .config/lxterminal folder
fi

###EOF###
