#!/bin/bash
set -euo pipefail

cd "${0%/*}" || exit 1

# Update
git submodule update --remote --merge

# VRF
cd ValveResourceFormat
dotnet clean --configuration Release Decompiler/Decompiler.csproj
dotnet publish --configuration Release -p:PublishSingleFile=true --runtime linux-x64 --self-contained Decompiler/Decompiler.csproj

# ProtobufDumper
cd ../SteamKit
dotnet clean --configuration Release Resources/ProtobufDumper/ProtobufDumper/ProtobufDumper.csproj
dotnet publish --configuration Release -p:PublishSingleFile=true --runtime linux-x64 --self-contained Resources/ProtobufDumper/ProtobufDumper/ProtobufDumper.csproj

# Strings
cd ../DumpStrings
go build

# Dumper
cd ../DumpSource2
git submodule update # git sucks
[ -d build ] && rm -r build
mkdir build
cd build
cmake ..
make -j 4
cd ../

# Verify
echo Checking that the executables work
cd ../
. ../common.sh

"$VRF_PATH" --version
"$PROTOBUF_DUMPER_PATH" -v
"$DUMP_STRINGS_PATH"
