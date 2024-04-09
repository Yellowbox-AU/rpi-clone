#!/usr/bin/env bash

# TODO: Check both namespace and start id are specified

if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ];
then
    echo "Missing required args. Usage: $0 <namespace> <startid> <firebase-project>"
    exit 1
fi

namespace=$1
i=$2
firebase_project=$3
set -x
for d in $(echo /dev/sd?); do
    sudo ./rpi-clone "${d//\/dev\//}" "$namespace-$i" "$firebase_project" -U &
    i=$((i + 1))
done
