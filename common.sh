#!/bin/bash

export LC_ALL=C

ROOT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
VRF_PATH="$ROOT_DIR/ValveResourceFormat/Decompiler/bin/Release/linux-x64/publish/Decompiler"
DUMP_STRINGS_PATH="$ROOT_DIR/DumpStrings/DumpStrings"
DO_GIT=1

if [[ $1 = "no-git" ]] || [[ $2 = "no-git" ]]; then
	DO_GIT=0
fi

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

		# Dump protobufs
		~/ProtobufDumper/ProtobufDumper "$file" "Protobufs/" > /dev/null

		# Dump strings
		file_type=""
		case "$1" in
			.dylib)
				file_type="macho"
				;;
			.so)
				file_type="elf"
				;;
			.dll)
				file_type="pe"
				;;
		esac

		"$DUMP_STRINGS_PATH" -binary "$file" -target "$file_type" > "$(echo "$file" | sed -e "s/$1$/_strings.txt/g")"
	done <   <(find . -type f -name "*$1" -print0)
}

ProcessVPK ()
{
	echo "> Processing VPKs"

	while IFS= read -r -d '' file
	do
		echo " > $file"

		"$VRF_PATH" --input "$file" --vpk_list > "$(echo "$file" | sed -e 's/\.vpk$/\.txt/g')"
	done <   <(find . -type f -name "*_dir.vpk" -print0)
}

ProcessToolAssetInfo ()
{
	echo "> Processing tools asset info"

	while IFS= read -r -d '' file
	do
		echo " > $file"

		"$VRF_PATH" --input "$file" --output "$(echo "$file" | sed -e 's/\.bin$/\.txt/g')" --tools_asset_info_short
	done <   <(find . -type f -name "*asset_info.bin" -print0)
}

FixUCS2 ()
{
	echo "> Fixing UCS-2"

	find . -type f -name "*.txt" -print0 | xargs --null --max-lines=1 --max-procs=3 "$ROOT_DIR/fix_encoding"
}

CreateCommit ()
{
	if ! [[ $DO_GIT == 1 ]]; then
		echo "Not performing git commit"
		return
	fi

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
