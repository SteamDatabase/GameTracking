#!/bin/bash

cd "${0%/*}"
. ../common.sh

echo "Processing HL2..."

ProcessDepot ".dylib"
FixUCS2

CreateCommit "$(grep "ClientVersion=" hl2/steam.inf | grep -o '[0-9\.]*')" "$1"
