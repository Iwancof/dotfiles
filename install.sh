#/bin/sh

set -ue

DPATH=~/.dotfiles

PACKAGE="apt install"
function install_surface() {
	${PACKAGE} git

	echo "settings zsh"
	${PACKAGE} zsh
	mkdir ~/.zsh
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh
	cat $DPATH/zshrc_config/zshrc_surface > $DPATH/.zshrc
}

function copy_settings() {
	for f in .??*
	do
		[ "$f" = ".git" ] && continue

		ln -snv "$DPATH/$f" "$HOME"/"$f"
	done
}

# copy_settings 


if [ $# != 1 ]; then
	echo "Usage: $0 option"

	exit
fi

if [ $1 = "surface" ]; then
	install_surface
else 
	echo "Unknown option"
fi
