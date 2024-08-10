#!/bin/bash

export LC_ALL=C

# Set working directory where this file is located
cd "${0%/*}"

. ./common.sh

if [[ $1 = "all" ]]; then
	echo "Going to process all folders"
	
	grep -o "\"[0-9]\+\"" files.json | while read -r dir; do
		# bloody bash, man
		dir="${dir%\"}"
		dir="${dir#\"}"
		
		./update.sh "${dir}" "no-git"
	done
	
	./update.sh 0 "no-git"
	
	exit 0
fi

# Validate that first argument is a number (depotid)
re='^[0-9]+$'
if ! [[ $1 =~ $re ]]; then
	echo "First argument must be an integer" >&2; exit 1
fi

echo "Processing depot $1..."

# Do stuff based on the depotid
case $1 in

# Half-Life 2
221)
	cd "hl2"
	ProcessVPK
	FixUCS2
	;;

223)
	cd "hl2"
	ProcessDepot ".dylib"
	;;

# Half-Life 2: Episode One
389)
	cd "hl2ep1"
	ProcessVPK
	FixUCS2
	;;

# Half-Life 2: Episode Two
420)
	cd "hl2ep2"
	ProcessVPK
	FixUCS2
	;;

# Half-Life 2: Death Match
321)
	cd "hl2dm"
	ProcessVPK
	FixUCS2
	;;

232372)
	cd "hl2dm"
	ProcessDepot ".dylib"
	;;

# Portal
401)
	cd "portal"
	ProcessVPK
	FixUCS2
	;;

403)
	cd "portal"
	ProcessDepot ".dylib"
	;;

# Portal 2
621)
	cd "portal2"
	ProcessVPK
	FixUCS2
	;;

624)
	cd "portal2"
	ProcessDepot ".dylib"
	;;

# Left 4 Dead
502)
	cd "l4d"
	ProcessVPK
	FixUCS2
	;;

515)
	cd "l4d"
	ProcessDepot ".dylib"
	;;

# Left 4 Dead 2
551)
	cd "l4d2"
	ProcessVPK
	FixUCS2
	;;

553)
	cd "l4d2"
	ProcessDepot ".dylib"
	;;

# Alien Swarm
631)
	cd "alienswarm"
	ProcessDepot ".dll"
	ProcessVPK
	FixUCS2
	;;

esac

if ! [[ $2 = "no-git" ]]; then
	CreateCommit "↑"
fi
