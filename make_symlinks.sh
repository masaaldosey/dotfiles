#!/bin/bash

# this script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles


# variables
dir=$HOME/dotfiles			# dotfiles directory
old_dir=$HOME/dotfiles_old		# old dotfiles backup directory
files="zshrc"			# list of files/folders to symlink in home directory


# create ~/dotfiles_old in home directory
echo -n "creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
echo "done"

# change to the dotfiles directory
echo -n "changing to $dir directory"
cd $dir
echo "done"


# move any existing dotfiles in home directory to ~/dotfiles_old
# then create symlinks from the home directory to files in ~/dotfiles
# specified in $files
for file in $files; do
	echo "moving any existing dotfiles from ~ to $old_dir"
	mv $HOME/.$file $old_dir/
	echo "creating symlink to $file in home directory"
	ln -s $dir/$file $HOME/.$file
done

# check if zsh installed. if yes, install oh-my-zsh using their official installer.
# currently works on macOS and Debian based systems. 
install_zsh() {
	if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
		if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
			sh -c "$(curl -fsSL https://ohmyz.sh/install.sh)"
		fi
	else
		platform="$(uname)"
		
		if [[ "$platform" == "Linux" ]]; then
			sudo apt-get update
			sudo apt-get install -y zsh
			install_zsh
		elif [[ "$platform" == "Darwin" ]]; then
			install_zsh
		else
			echo "unsupported OS: $platform"
			return 1
		fi
	fi
}

install_zsh


