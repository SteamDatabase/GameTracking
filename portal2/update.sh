#!/bin/bash

cd "${0%/*}"
. ../common.sh

echo "Processing Portal 2..."

ProcessDepot ".dylib"
FixUCS2

CreateCommit "$(grep "ClientVersion=" portal2/steam.inf | grep -o '[0-9\.]*')" "$1"
