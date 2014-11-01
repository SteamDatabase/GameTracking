#!/bin/bash

# Validate that first argument is a number (depotid)
re='^[0-9]+$'
if ! [[ $1 =~ $re ]]; then
	echo "First argument must be an integer" >&2; exit 1
fi

# Set working directory where this file is located
cd "${0%/*}"

# Do stuff based on the depotid
case $1 in

# Team Fortress 2
232251)
	mono .support/ProtobufDumper.exe "$1/server.dll" "Protobufs/tf/" > /dev/null
	
	strings "$1/server.dll" | grep "buildslave" | sort -u > "BuildbotPaths/tf.txt"
	;;

# Counter-Strike: Global Offensive
732)
	mono .support/ProtobufDumper.exe "$1/engine.dll" "Protobufs/csgo/" > /dev/null
	mono .support/ProtobufDumper.exe "$1/server.dll" "Protobufs/csgo/" > /dev/null
	
	strings "$1/engine.dll" | grep "buildslave" | sort -u > "BuildbotPaths/csgo_engine.txt"
	strings "$1/server.dll" | grep "buildslave" | sort -u > "BuildbotPaths/csgo_server.txt"
	;;

# Dota 2
573)
	mono .support/ProtobufDumper.exe "$1/engine.dll" "Protobufs/dota/" > /dev/null
	mono .support/ProtobufDumper.exe "$1/server.dll" "Protobufs/dota/" > /dev/null
	
	strings "$1/engine.dll" | grep "buildslave" | sort -u > "BuildbotPaths/dota_engine.txt"
	strings "$1/server.dll" | grep "buildslave" | sort -u > "BuildbotPaths/dota_server.txt"
	;;

# Dota 2 Test
205793)
	mono .support/ProtobufDumper.exe "$1/engine.dll" "Protobufs/dota_test/" > /dev/null
	mono .support/ProtobufDumper.exe "$1/server.dll" "Protobufs/dota_test/" > /dev/null
	
	strings "$1/engine.dll" | grep "buildslave" | sort -u > "BuildbotPaths/dota_test_engine.txt"
	strings "$1/server.dll" | grep "buildslave" | sort -u > "BuildbotPaths/dota_test_server.txt"
	;;

# Dota 2 Workshop
313250)
	mono .support/ProtobufDumper.exe "$1/engine2.dll" "Protobufs/dota_s2/engine2/" > /dev/null
	mono .support/ProtobufDumper.exe "$1/server.dll" "Protobufs/dota_s2/server/" > /dev/null
	
	strings "$1/engine2.dll" | grep "buildslave" | sort -u > "BuildbotPaths/dota_s2_engine2.txt"
	strings "$1/server.dll" | grep "buildslave" | sort -u > "BuildbotPaths/dota_s2_server.txt"
	;;

esac

git add -A
git commit -a -m "$(git status --porcelain | sed '{:q;N;s/\n/, /g;t q}' | sed 's/^ *//g')"
git push
