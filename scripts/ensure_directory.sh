#!/bin/sh

if [[ $# -ne 1 ]]
then
	echo "ArgumentsError:"
	echo "  expected 1, but got $#."
	exit 1
fi

if [[ ! -d "$1" ]]
then
	echo "ConstraitError:"
	echo "  expected $1 is directory, but isn't."
	exit 1
fi

exit 0
