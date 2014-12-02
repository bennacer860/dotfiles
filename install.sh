#!/bin/bash
###################################
# this script simply backup existing dotfiles in a directory and creates symlink to ~/dotefiles
####################################


dir    = ~/dotfiles
olddir = ~/dotfiles_old #we backup the old dotfiles here
files  = "vimrc tmux.conf"

# create backup  files
echo "Create Backup files in $olddir"
mkdir -p $olddir
echo "...done"


# change to dotfile directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"


# move any existing dotile and create symlink
for file in $files; do
  #move files to old directory
  if [[-e ~/.$file]];then
    echo "Move $file  from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old
  fi  
 
  #create a symlink if we dont already have one
  if [[-e ~/.$file]];then
    echo "Symlink already exist : $file"	  
  else	  
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file/.$file
  fi  
done
