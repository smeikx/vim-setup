#!/bin/sh

PACK_ROOT="$1"

for dir in "$PACK_ROOT"/*/*/*
do
	test -d "$dir/.git" || basename "$dir"
done

