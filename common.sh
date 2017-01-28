#!/bin/bash

export LC_ALL=C

ProcessDepot ()
{
	mkdir -p "BuildbotPaths" "Protobufs" "Symbols" "Strings"
	
	while IFS= read -r -d '' file
	do
		baseFile=$(basename "$file" "$1")
		
		if [ "$baseFile" = "steamclient" ]
		then
			continue
		fi
		
		echo "> $baseFile"
		
		mono ../.support/ProtobufDumper.exe "$file" "Protobufs/" > /dev/null
		
		strings "$file" | grep "buildslave" | grep -v "/.ccache/tmp/" | sort -u > "BuildbotPaths/$baseFile.txt"
		
		nmBinary=nm
		
		if [ "$1" = ".dylib" ]
		then
			nmBinary=../.support/nm-with-macho
		fi
		
		if [ "$1" = ".dylib" ] || [ "$1" = ".so" ]
		then
			$nmBinary -C -p "$file" | grep -Evi "GCC_except_table|google::protobuf" | awk '{$1=""; print $0}' | sort -u > "Symbols/$baseFile.txt"
		fi
		
		strings "$file" -n 5 | grep -Evi "protobuf|GCC_except_table|osx-builder\." | c++filt -t_ | sort -u > "Strings/$baseFile.txt"
	done <   <(find . -type f -name "*$1" -print0)
}

ProcessVPK ()
{
	while IFS= read -r -d '' file
	do
		baseFile="${file%.*}.txt"
		
		echo "> VPK $baseFile"
		
		../.support/vpktool "$file" > "$baseFile"
	done <   <(find . -type f -name "*_dir.vpk" -print0)
}

CreateCommit ()
{
	git add -A
	git commit -S -a -m "$1 | $(git status --porcelain | wc -l) files | $(git status --porcelain | sed '{:q;N;s/\n/, /g;t q}' | sed 's/^ *//g' | cut -c 1-1024)"
	git push
}
