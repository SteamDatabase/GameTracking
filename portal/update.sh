#!/bin/bash

cd "${0%/*}"
. ../common.sh

echo "Processing Portal..."

ProcessDepot ".dylib"
ProcessVPK
FixUCS2

CreateCommit "$(grep "ClientVersion=" portal/steam.inf | grep -o '[0-9\.]*')" "$1"
