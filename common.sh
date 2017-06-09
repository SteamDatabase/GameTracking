#!/bin/bash

export LC_ALL=C

ProcessDepot ()
{
	echo "> Processing binaries"
	
	mkdir -p "Protobufs"
	
	while IFS= read -r -d '' file
	do
		if [ "$(basename "$file" "$1")" = "steamclient" ]
		then
			continue
		fi
		
		echo " > $file"
		
		mono ../.support/ProtobufDumper.exe "$file" "Protobufs/" > /dev/null
		
		nmBinary=nm
		
		if [ "$1" = ".dylib" ]
		then
			nmBinary=../.support/nm-with-macho
		fi
		
		if [ "$1" = ".dylib" ] || [ "$1" = ".so" ]
		then
			$nmBinary -C -p "$file" | grep -Evi "GCC_except_table|google::protobuf" | awk '{$1=""; print $0}' | sort -u > "$(echo "$file" | sed -e "s/$1$/.txt/g")"
		fi
		
		strings "$file" -n 5 | grep -Evi "protobuf|GCC_except_table|osx-builder\." | c++filt -t_ | sort -u > "$(echo "$file" | sed -e "s/$1$/_strings.txt/g")"
	done <   <(find . -type f -name "*$1" -print0)
}

ProcessVPK ()
{
	echo "> Processing VPKs"
	
	while IFS= read -r -d '' file
	do
		echo " > $file"
		
		../.support/vpktool "$file" > "${file%.*}.txt"
		
		mono ../.support/SourceDecompiler/Decompiler.exe -i "$file" -o "$(echo "$file" | sed -e 's/\.vpk$/\//g')"
	done <   <(find . -type f -name "*_dir.vpk" -print0)
}

FixUCS2 ()
{
	echo "> Fixing UCS-2"

	while IFS= read -r -d '' file
	do
		if ! file --mime "$file" | grep "charset=utf-16le"
		then
				continue
		fi

		recode UTF16LE..UTF8 "$file"
	done <   <(find . -type f -name "*.txt" -print0)
}

CreateCommit ()
{
	git add -A
	git commit -S -a -m "$1 | $(git status --porcelain | wc -l) files | $(git status --porcelain | sed '{:q;N;s/\n/, /g;t q}' | sed 's/^ *//g' | cut -c 1-1024)"
	git push
}

