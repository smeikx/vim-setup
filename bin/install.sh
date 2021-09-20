#!/bin/sh

if [ $# -lt 3 ]
then
	echo '$1 → Where are packages installed to?'
	echo '$2 → The file containing the package list.'
	echo '$3 → Where are patches to be found?'
	exit 1
fi

pack_dir=`readlink -m "$1"` # Where are packages installed to?
pack_list=`readlink -m "$2"` # The file containing the package list.
patch_dir=`readlink -m "$3"` # Where are patches to be found?

# interpreted by built-in ‘read’ as a separator for defining variables
IFS=','

# 1. remove blank lines
# 2. remove comments
# 3. substitue separator 
sed -e '/^\s*$/d' \
	-e '/^#.*$/d' \
	-e "s/ - /$IFS/g" \
	"$pack_list" \
| while read name url category load_moment
do
	destination="$pack_dir/$category/$load_moment"

	[ -d "$destination" ] || mkdir -p "$destination"
	
	destination="$destination/$name" 
	if [ -d "$destination" ]
	then
		echo "$destination already exist, cannot install." >&2
		continue
	fi

	git clone -q --depth=1 "$url" "$destination" >/dev/null >&2
	if [ $? -ne 0 ]
	then
		echo "Could not clone to $destination …" >&2
		continue
	fi

	patch_file="$patch_dir/$name.patch" 
	if [ -f "$patch_file" ]
	then
		cd "$destination"
		git apply "$patch_file" >/dev/null 1>&2 \
		|| echo "Could not apply $patch_file in $destination …" >&2
		cd - >/dev/null
	fi
done

echo 'Done.'
