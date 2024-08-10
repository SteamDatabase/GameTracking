#!/bin/bash

cd "${0%/*}"
. ../common.sh

echo "Processing HL2 DM..."

ProcessDepot ".dylib"
ProcessVPK
FixUCS2

CreateCommit "$(grep "ClientVersion=" hl2mp/steam.inf | grep -o '[0-9\.]*')" "$1"
