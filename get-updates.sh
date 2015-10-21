#!/usr/bin/env bash
function getUpdates() {
	mkdir -p "Packages/User";
	rsync -avh $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/aihowes ./Packages;
	rsync -avh $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/Material\ Theme ./Packages;
	rsync -avh $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ./Packages;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	getUpdates;
else
	read -p "This may overwrite existing files in this directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		getUpdates;
	fi;
fi;
unset getUpdates;