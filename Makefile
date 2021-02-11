
DOTPATH = ~/dotfiles

.PHONY: all

all: dotfiles
	echo "all"

.PHONY: dotfiles
dotfiles:
	for f in .??*
	do
		[ "$f" = ".git" ] && continud
		
		ln -snv "$(DOTPATH)/$f" "$HOME"/"$f"
	done

