#!/usr/bin/env bash

# Let's get the full path where the script resides
my_dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks for my dotfiles
ln -sfv "$my_dotfiles/.bashrc" ~
ln -sfv "$my_dotfiles/.bash_profile" ~
ln -sfv "$my_dotfiles/.bash_prompt" ~
ln -sfv "$my_dotfiles/.aliases" ~
ln -sfv "$my_dotfiles/.functions" ~
ln -sfv "$my_dotfiles/.exports" ~
ln -sfv "$my_dotfiles/.inputrc" ~

source ~/.bashrc
