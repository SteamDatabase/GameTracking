#!/bin/bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
	echo "$(basename "$0") <game folder name> <mod name>"
	exit 1
fi

TOOLS_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
DUMPER_PATH="$TOOLS_DIR/DumpSource2/build/DumpSource2"

cd "$TOOLS_DIR" || exit 1

MOD_NAME="$2"
CORE_DIR="$(realpath "../$1/game/bin/linuxsteamrt64/")"
DUMP_DIR="$(realpath "../$1/DumpSource2/")"

cd "$CORE_DIR" || exit 1

# Create a stub of libvideo to avoid installing video dependencies
python3 "$TOOLS_DIR/implib/implib-gen.py" --no-dlopen libvideo.so
mv libvideo.so libvideo.so.original
gcc -DIMPLIB_EXPORT_SHIMS=1 -g -fPIC -shared libvideo.so.tramp.S libvideo.so.init.c -ldl -o libvideo.so
rm libvideo.so.tramp.S libvideo.so.init.c

LD_LIBRARY_PATH="$CORE_DIR" timeout 2m "$DUMPER_PATH" "$MOD_NAME" "$DUMP_DIR" || true

mv libvideo.so.original libvideo.so
