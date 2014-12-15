#!/bin/bash
###################################
# this script simply backup existing dotfiles in a directory and creates symlink to ~/dotefiles
####################################


dir=~/dotfiles
olddir=~/dotfiles_old #we backup the old dotfiles here
files="git-flow-completion.zsh vimrc tmux.conf gitignore gitconfig githelpers"

#create backup,undo folder for vim
mkdir ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo

# create backup  files
echo "Create Backup files in $olddir"
mkdir -p $olddir
echo "...done"


# change to dotfile directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

#get vbundle ready
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# move any existing dotile and create symlink
for file in $files; do
  #move files to old directory
  if [ -e ~/.$file ] ; then
    echo "Move $file  from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old
  fi  
 
  #create a symlink if we dont already have one
  if [ -e ~/.$file ] ; then
    echo "Symlink already exist : $file"	  
  else	  
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
  fi  
done

#vbundle install
vim -E -c BundleInstall -c q

#install color scheme
mkdir -p ~/.vim/colors
cp ~/dotfiles/colors/molokai.vim ~/.vim/colors

#install zsh
curl -L http://install.ohmyz.sh | sh

#install rvm
curl -sSL https://get.rvm.io | bash -s stable --rails

