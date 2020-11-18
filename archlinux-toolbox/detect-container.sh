#!/bin/sh

if [ "$container" == "oci" ]
then
	echo "im in a container"
else
	echo "im not in a container"
fi
