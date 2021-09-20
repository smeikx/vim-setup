#!/bin/sh

if [ -z "$1" ]
then
	echo 'I need one directory as only argument to know where to search.'
	exit 1
fi

start_dir=`readlink -m "$1"`

find $1 -name '.git' -type d \
| sed -nE 's|(.*)/\.git|\1|p' \
| while read package
do
	cd "$package" >/dev/null
	git pull --no-tags --autostash >/dev/null 2>&1 \
	|| echo "Problem with updating `basename $package` …"

	patch="$patch_dir/`basename $package`.patch" 
	if [ -f "$patch" ] 
	then git apply "$path" || echo "$patch could not be applied …"
	fi

	cd - 1 >/dev/null
done

echo 'Done.'
