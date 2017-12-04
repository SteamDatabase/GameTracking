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
	
	./update.sh 0
	
	exit 0
fi

# Validate that first argument is a number (depotid)
re='^[0-9]+$'
if ! [[ $1 =~ $re ]]; then
	echo "First argument must be an integer" >&2; exit 1
fi

ProcessDepot ()
{
	while IFS= read -r -d '' file
	do
		baseFile=$(basename "$file" "$2")
		
		if [ "$baseFile" = "steamclient" ]
		then
			continue
		fi
		
		echo "> $baseFile"
		
		dotnet ~/ProtobufDumper/ProtobufDumper.dll "$file" "Protobufs/$1/" > /dev/null
		
		mkdir -p "BuildbotPaths/$1"
		
		strings "$file" | grep "buildslave" | grep -v "/.ccache/tmp/" | sort -u > "BuildbotPaths/$1/$baseFile.txt"
		
		nmBinary=nm
		
		if [ "$2" = ".dylib" ]
		then
			nmBinary=./.support/nm-with-macho
		fi
		
		if [ "$2" = ".dylib" ] || [ "$2" = ".so" ]
		then
			mkdir -p "Symbols/$1"
			
			$nmBinary -C -p "$file" | grep -Evi "GCC_except_table|google::protobuf" | awk '{$1=""; print $0}' | sort -u > "Symbols/$1/$baseFile.txt"
		fi
		
		#if [ "$2" != ".dylib" ] || [ "$1" = "csgo" ]
		#then
			mkdir -p "Strings/$1"
			
			strings "$file" -n 5 | grep -Evi "protobuf|GCC_except_table|osx-builder\." | c++filt -_ | sort -u > "Strings/$1/$baseFile.txt"
		#fi
	done <   <(find "$1/" -type f -name "*$2" -print0)
}

ProcessVPK ()
{
	while IFS= read -r -d '' file
	do
		baseFile="${file%.*}.txt"
		
		echo "> VPK $baseFile"
		
		./.support/vpktool "$file" > "$baseFile"
	done <   <(find "$1/" -type f -name "*_dir.vpk" -print0)
}

echo "Processing depot $1..."

# Do stuff based on the depotid
case $1 in

# Half-Life 2
221)
	ProcessVPK "hl2"
	FixUCS2
	;;

223)
	ProcessDepot "hl2" ".dylib"
	;;

# Half-Life 2: Episode One
389)
	ProcessVPK "hl2ep1"
	FixUCS2
	;;

# Half-Life 2: Episode Two
420)
	ProcessVPK "hl2ep2"
	FixUCS2
	;;

# Half-Life 2: Death Match
321)
	ProcessVPK "hl2dm"
	FixUCS2
	;;

232372)
	ProcessDepot "hl2dm" ".dylib"
	;;

# Portal
401)
	ProcessVPK "portal"
	FixUCS2
	;;

403)
	ProcessDepot "portal" ".dylib"
	;;

# Portal 2
621)
	ProcessVPK "portal2"
	FixUCS2
	;;

624)
	ProcessDepot "portal2" ".dylib"
	;;

# Left 4 Dead
502)
	ProcessVPK "l4d"
	FixUCS2
	;;

515)
	ProcessDepot "l4d" ".dylib"
	;;

# Left 4 Dead 2
551)
	ProcessVPK "l4d2"
	FixUCS2
	;;

553)
	ProcessDepot "l4d2" ".dylib"
	;;

# Alien Swarm
631)
	ProcessVPK "alienswarm"
	ProcessDepot "alienswarm" ".dll"
	FixUCS2
	;;

esac

if ! [[ $2 = "no-git" ]]; then
	CreateCommit "↑"
fi
