#!/bin/sh

PACK_ROOT="$1"

update_package ()
{
	plugin=$1
	echo ''
	cd "$plugin" && basename "$plugin" && git pull --rebase
	cd - > /dev/null
}

for DIR in "$PACK_ROOT"/*/*
do
	for PLUGIN in "$DIR"/*
	do
		[ -d "$PLUGIN/.git" ] && update_package "$PLUGIN" &
	done
done

wait # for background jobs to finish
