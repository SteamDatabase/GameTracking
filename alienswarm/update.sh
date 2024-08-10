#!/bin/bash

cd "${0%/*}"
. ../common.sh

echo "Processing Alien Swarm..."

ProcessDepot ".dll"
ProcessVPK
FixUCS2

CreateCommit "$(grep "PatchVersion=" swarm/steam.inf | grep -o '[0-9\.]*')" "$1"
