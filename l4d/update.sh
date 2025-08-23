#!/bin/bash

cd "${0%/*}"
. ../common.sh

echo "Processing L4D..."

ProcessDepot ".dylib"
FixUCS2

CreateCommit "$(grep "ClientVersion=" left4dead/steam.inf | grep -o '[0-9\.]*')" "$1"
