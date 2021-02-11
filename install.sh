#!/bin/zsh

set -ue

DPATH=~/dotfiles

PACKAGE="apt install" 
function install_surface() {
	eval ${PACKAGE} git

	echo "settings zsh"
	eval ${PACKAGE} zsh
	mkdir ~/.zsh -p
	if [ -d ~/.zsh/autosuggestions/ ]; then
		echo "Already cloned"
	else
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/autosuggestions --progress
	fi
	cat $DPATH/zshrc_config/zshrc_surface > $DPATH/.zshrc
}

function copy_settings() {
	for f in .??*
	do
		[ "$f" = ".git" ] && continue

		ln -snvf "$DPATH/$f" "$HOME"/"$f"
	done
}

# copy_settings 


if [ $# != 1 ]; then
	echo "Usage: $0 option"

	exit
fi

if [ $1 = "surface" ]; then
	install_surface
	copy_settings
else 
	echo "Unknown option"
fi
