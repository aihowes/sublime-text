#!/usr/bin/env bash
function bootstrap() {
	rsync -avh ./Packages/ $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	bootstrap;
else
	read -p "This may overwrite existing files in your User directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bootstrap;
	fi;
fi;
unset bootstrap;