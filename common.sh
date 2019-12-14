#!/bin/bash

export LC_ALL=C

ProcessDepot ()
{
	echo "> Processing binaries"
	
#	rm -r "Protobufs"
	mkdir -p "Protobufs"
	
	while IFS= read -r -d '' file
	do
		if [ "$(basename "$file" "$1")" = "steamclient" ]
		then
			continue
		fi
		
		echo " > $file"
		
		dotnet ~/ProtobufDumper/ProtobufDumper.dll "$file" "Protobufs/" > /dev/null
		
		nmBinary="nm"
		
		if [ "$1" = ".dylib" ]
		then
			nmBinary="$(dirname "${BASH_SOURCE[0]}")/.support/nm-with-macho"
		fi
		
		if [ "$1" = ".dylib" ] || [ "$1" = ".so" ]
		then
			$nmBinary -C -p "$file" | grep -Evi "GCC_except_table|google::protobuf" | awk '{$1=""; print $0}' | sort -u > "$(echo "$file" | sed -e "s/$1$/.txt/g")"
		fi
		
		strings "$file" -n 5 | grep -Evi "protobuf|GCC_except_table|osx-builder\." | c++filt -_ | sort -u > "$(echo "$file" | sed -e "s/$1$/_strings.txt/g")"
	done <   <(find . -type f -name "*$1" -print0)
}

ProcessVPK ()
{
	echo "> Processing VPKs"
	
	while IFS= read -r -d '' file
	do
		echo " > $file"
		
		"$(dirname "${BASH_SOURCE[0]}")/.support/vpktool" "$file" > "${file%.*}.txt"
		
		dotnet /home/steamdb/ValveResourceFormat/Decompiler/bin/Release/netcoreapp2.0/Decompiler.dll --input "$file" --output "$(echo "$file" | sed -e 's/\.vpk$/\//g')" --vpk_cache --vpk_decompile --vpk_extensions "vxml_c,vjs_c,vcss_c,vsndevts_c,vpcf_c,json,txt,cfg,res,pop,gameevents,png,jpg,gif"
	done <   <(find . -type f -name "*_dir.vpk" -print0)
}

FixUCS2 ()
{
	echo "> Fixing UCS-2"

	while IFS= read -r -d '' file
	do
	#	((i=i%20)); ((i++==0)) && wait
		"$(dirname "${BASH_SOURCE[0]}")/fix_encoding" "$file" &
	done <   <(find . -type f -name "*.txt" -print0)
	wait
}

CreateCommit ()
{
	message="$1 | $(git status --porcelain | wc -l) files | $(git status --porcelain | sed '{:q;N;s/\n/, /g;t q}' | sed 's/^ *//g' | cut -c 1-1024)"

	if [ -n "$2" ]; then
		bashpls=$'\n\n'
		message="${message}${bashpls}https://steamdb.info/patchnotes/$2/"
	fi

	git add -A
	git commit -S -a -m "$message"
	git push
	
	~/ValveProtobufs/update.sh
}

