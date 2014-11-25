#!/bin/bash
###################################
# this script simply backup existing dotfiles in a directory and creates symlink to ~/dotefiles
####################################


dir    = ~/dotfiles
olddir = ~/dotfiles_old #we backup the old dotfiles here
files  = "vimrc tmux.conf"
