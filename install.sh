#!/usr/bin/env bash

# Let's get the full path where the script and git repository resides
my_dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
my_git=" git --work-tree="$my_dotfiles" --git-dir="$my_dotfiles/.git" ";

# List of dotfiles that we want to link to users home directory
declare -a listOfFiles=(".gitignore_global" ".bashrc" ".bash_profile" ".bash_prompt" ".aliases" ".functions" ".exports" ".inputrc");

# Create symlinks for my dotfiles
function linkIt() {

  for dotfile in "${listOfFiles[@]}"
	do
		#  dotfile exists and is not a symlink 
	  if [[ -e ~/$dotfile && ! -L ~/$dotfile ]]; then
      # lets create a backup of existing file and replace it with a symlink 
			mv -v ~/$dotfile ~/$dotfile.bak;
			# create the symlink
			ln -sfv "$my_dotfiles/$dotfile" ~;
		elif [[ ! -e ~/$dotfile && ! -L ~/$dotfile ]]; then 
			# if dotfile is not a symlink, then create the symlink
		  ln -sfv "$my_dotfiles/$dotfile" ~;
		fi
	done

}


# Make sure we have the latest update
[ -d "$my_dotfiles/.git" ] && ${my_git} pull origin master && ${my_git} submodule update;

# install & activate
linkIt;
source ~/.bashrc;

# Cleanup
unset my_dotfiles my_git listOfFiles linkIt;
