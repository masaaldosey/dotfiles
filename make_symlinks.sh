#!/bin/bash

# this script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# usage: ./make_symlinks.sh [file1 file2 file3 ...]
# example: ./make_symlinks.sh zshrc vimrc bashrc

# variables
dir=$HOME/dotfiles			                # dotfiles directory
old_dir=$HOME/dotfiles_old		            # old dotfiles backup directory
files="${@:-zshrc vimrc bashrc}"			# list of files/folders to symlink in home directory


# validate if the directory exists
if [[ ! -d "dir" ]]; then
    echo "error: dotfiles directory not found at $dir"
    exit 1
fi

# create ~/dotfiles_old in home directory
echo "creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
echo "done"

# change to the dotfiles directory
echo "changing to $dir directory"
cd $dir || exit 1
echo "done"


# move any existing dotfiles in home directory to ~/dotfiles_old
# then create symlinks from the home directory to files in ~/dotfiles
# specified in $files
for file in $files; do
	echo "moving any existing $file from ~ to $old_dir"
	dotfile="$HOME/.$file"
    source="$dir/$file"

    # check if source file exists in dotfiles directory
    if [[ ! -e "$source" ]]; then
        echo "warning: $source does not exist, skipping $file"
        continue
    fi

    # back-up existing dotfile if it exists
    if [[ -e "$dotfile" ]]; then
        echo "moving existing $file from ~ to $old_dir"
        mv "$dotfile" "$old_dir/" || echo "error: failed to move $file"
    fi

    # create symlink
    echo "creating symlink to $file in home directory"
    ln -s "$source" "$dotfile" || echo "error: failed to create symlink for $file"
done

# check if zsh installed. if yes, install oh-my-zsh using their official installer.
# currently works on macOS and Debian based systems.
install_zsh() {
	if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        fi
	else
		platform="$(uname)"

		if [[ "$platform" == "Linux" ]]; then
		    echo "installing zsh..."
            sudo apt-get update
            sudo apt-get install -y zsh
			install_zsh
		elif [[ "$platform" == "Darwin" ]]; then
		    echo "installing zsh via homebrew..."
			install_zsh
		else
			echo "error: unsupported OS = $platform"
			return 1
		fi
	fi
}

install_zsh
