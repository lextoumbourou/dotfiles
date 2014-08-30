#!/bin/bash

function check_or_move {
    # If file exists and isn't already symbolic link move to a backup
    check_file=$1
    backup_file=$1'.backup'
    cd $HOME

    if [ -L $check_file ]
    then
            rm -v $check_file
    fi

    if [ -f $check_file ] 
    then
            mv -v $check_file $backup_file
    fi

}

# Create a host specific bash file
touch ~/.host.bashrc

check_or_move '.vim'
ln -sv ~/dotfiles/vim ~/.vim

check_or_move '.vimrc'
ln -sv ~/dotfiles/vim/vimrc ~/.vimrc

check_or_move '.bashrc'
ln -sv ~/dotfiles/bash/bashrc ~/.bashrc

check_or_move '.screenrc'
ln -sv ~/dotfiles/screen/screenrc ~/.screenrc

check_or_move '.tmux.conf'
ln -sv ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

check_or_move '.inputrc'
ln -sv ~/dotfiles/bash/inputrc ~/.inputrc
