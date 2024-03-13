#!/usr/bin/env bash

# TODO: Check both namespace and start id are specified

if [ "$1" == "" ] || [ "$2" == "" ]
then
    echo "Missing required args. Usage: $0 <namespace> <startid>"
    exit 1
fi

namespace=$1
i=$2
set -x
for d in $(echo /dev/sd?); do
    sudo ./rpi-clone "${d//\/dev\//}" -s "$namespace-$i" -U &
    i=$((i + 1))
done
