#/bin/sh

DPATH=~/.dotfiles

for f in .??* do
	[ "$f" = ".git" ] && continue

	ln -snv "$DPATH/$f" "$HOME"/"$f"
done

