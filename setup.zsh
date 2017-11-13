#!/usr/bin/env zsh

main() {
	pause "This will setup symlinks to enable Prezto for zsh. Press any key to continue."

	SETUP_DIR="${${(%):-%x}:h:a}"
	symlink "$SETUP_DIR" "${ZDOTDIR:-$HOME}/.zprezto"

	setopt EXTENDED_GLOB
	for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
		symlink "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	done
}

pause() read -s -k "?$*"$'\n'

symlink() ln -shiv "$@"

main
