#!/usr/bin/env bash

# Let's get the full path where the script and git repository are located
my_dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";


# Update my git repo and submodules
function update() {
  local my_git=" git --work-tree=$my_dotfiles --git-dir=$my_dotfiles/.git ";
  [ -d "$my_dotfiles/.git" ] && ${my_git} pull origin master && ${my_git} submodule init && ${my_git} submodule update;
}

# Move dotfiles to backup directory
function doBackup() {
  local backup_dir="dotfile_backup" dotfile="$1";
  #create backup folder if it does not exist
  if [ ! -e ~/$backup_dir ]; then
    mkdir -pv ~/$backup_dir;
  fi
    
  # lets create a backup of existing file and replace it with a symlink
  mv -v ~/"$dotfile" ~/"$backup_dir"/"$dotfile";
}

# Create symlinks for my dotfiles
function symlink() {
  declare -a targets=("${!1}");  # Array of targets
  local linkname="$2";           # Name of the linked file
  
  for dotfile in "${targets[@]}"
  do    
    if [[ -e ~/$dotfile && ! -L ~/$dotfile ]]; then
      # We might want to backup our stuff
      doBackup "$dotfile";
    fi
    
    # create the symlink
    ln -sfv "$my_dotfiles/$dotfile" "$linkname";
  done
}

# Creates a dotfile with config.
function addConfig() {
  local dotfile="$1" config="$2";

  if [ ! -e "$dotfile" ]; then
    # Create the file
    printf "Created the dotfile %s\n" "$dotfile";
    touch "$dotfile";
    # Add config to the file
    printf "The config: '%s' added to the file: %s\n" "$config" "$dotfile";
    echo -n "$config" > "$dotfile";
  fi
}

# Runs the installation
function main() {
   # List of dotfiles that we want to link to users home directory
  local dotfiles=("tools/git/.gitignore_global" "tools/git/.gitconfig" "shell/bash/.bashrc" "shell/bash/.bash_profile" \
  "shell/bash/.bash_prompt" "system/.aliases" "system/functions/.functions" "system/functions/.docker_functions" "system/functions/.git_functions" "system/.exports" "system/.inputrc" "tools/wget/.wgetrc" \
  "tools/vim/.vimrc" "tools/vim/.vim" "tools/gvim/.gvimrc");  
  local svnfiles=("tools/subversion/config" "tools/subversion/servers");
  local configfiles=("tools/terminator");

  # Make sure we have the latest update
  update;

  # install & activate
  printf "Creating symlinks for .files\n"
  symlink dotfiles[@] ~;

  printf "Creating symlinks for .subversion\n"
  symlink svnfiles[@] ~/.subversion;
  
  printf "Creating symlinks for .config\n"
  symlink configfiles[@] ~/.config/;

  printf "Creating extra config files\n"
  addConfig ~/.extra "export DOTFILES_HOME=$my_dotfiles";
  addConfig ~/.gitconfig_extra "";
  source ~/.bashrc; 
}

main;                   # Execute program
unset my_dotfiles main; # Cleanup