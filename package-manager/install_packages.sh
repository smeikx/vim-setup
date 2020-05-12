#!/bin/sh

PACK_ROOT="$1" # Where shall packages be installed?
PACK_LIST="$2" # Where is the package list?
PATCH_DIR="$3" # Where are the patches?

install_plugin ()
{
	name="$1"
	url="$2"
	category="$3"
	load_moment="$4"
	
	package_path="$PACK_ROOT/$category/$load_moment"

	# check if the plugin’s directory already exists and
	# exit if it does (important when re-running this script)
	[ -d "$package_path" ] && return 1

	mkdir -p "$package_path"
	
	destination="$package_path/$name" 
	[ -d "$destination" ] || git clone --depth=1 "$url" "$destination"

	patch_file="$PATCH_DIR/$name.patch" 
	if [ $? -eq 0 ] && [ -f "$patch_file" ]
	then
		patch=$(cat "$patch_file")
		cd "$destination"

		# this is only necessary, because ‘git am’ will not work otherwise,
		# even though the required information is suplied through the patch.
		git config --local user.name 'package-manager' && \
		git config --local user.email 'pack@man.vim' && \
		git am <<- EOF
			$patch
		EOF
		cd -
	fi
}


# interpreted by built-in ‘read’ as a separator for defining variables
export IFS=','

# 1. remove blank lines
# 2. remove comments
# 3. substitue separator 
sed -e '/^\s*$/d' \
	-e '/^#.*$/d' \
	-e "s/ - /$IFS/g" \
	"$PACK_LIST" \
| while read name url category load_moment
do
	install_plugin $name $url $category $load_moment &
done

wait # for background jobs to finish

