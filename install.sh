#!/usr/bin/env bash

# Let's get the full path where the script and git repository are located
my_dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
my_git=" git --work-tree="$my_dotfiles" --git-dir="$my_dotfiles/.git" ";

# List of dotfiles that we want to link to users home directory
declare -a listOfFiles=(".gitignore_global" ".bashrc" ".bash_profile" ".bash_prompt" ".aliases" ".functions" ".exports" ".inputrc");

# Update my git repo and submodules
function gitMe() {
  [ -d "$my_dotfiles/.git" ] && ${my_git} pull origin master && ${my_git} submodule update;
}

# Move dotfiles to backup directory
function doBackup() {
  local backup_dir="dotfile_backup" dotfile="$1";
  #create backup folder if it does not exist
  if [ ! -e ~/$backup_dir ]; then
    mkdir -pv ~/$backup_dir;
  fi
    
  # lets create a backup of existing file and replace it with a symlink
  mv -v ~/$dotfile ~/$backup_dir/$dotfile;
  ln -sfv "$my_dotfiles/$dotfile" ~;
}

# Create symlinks for my dotfiles
function linkIt() {
  for dotfile in "${listOfFiles[@]}"
  do
  	if [[ -e ~/$dotfile && ! -L ~/$dotfile ]]; then
      # We might want to backup our stuff
      doBackup $dotfile;
    elif [[ ! -e ~/$dotfile && ! -L ~/$dotfile ]]; then 
	  # create the symlink
	  ln -sfv "$my_dotfiles/$dotfile" ~;
	fi
  done
}


# Make sure we have the latest update
gitMe;

# install & activate
linkIt;
source ~/.bashrc;

# Cleanup
unset my_dotfiles my_git listOfFiles gitMe doBackup linkIt;