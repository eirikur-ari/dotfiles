#!/usr/bin/env bash

# Let's get the full path where the script resides
my_dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# List of dotfiles that we want to link to users home directory
declare -a listOfFiles=(".bashrc" ".bash_profile" ".bash_prompt" ".aliases" ".functions" ".exports" ".inputrc")

# Create symlinks for my dotfiles
function linkIt() {

  for dotfile in "${listOfFiles[@]}"
	do

		#  dotfile exists and is not a symlink 
	  if [[ -e ~/$dotfile && ! -L ~/$dotfile ]]; then
      # lets create a backup of existing file
			mv -v ~/$dotfile ~/$dotfile.bak
		fi

		# create symlink
		ln -sfv "$my_dotfiles/$dotfile" ~

	done

}

# install
linkIt
source ~/.bashrc

# Cleanup
unset my_dotfiles listOfFiles
