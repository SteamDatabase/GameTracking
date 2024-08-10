#!/bin/bash
cd ValveResourceFormat
git pull
dotnet clean --configuration Release Decompiler/Decompiler.csproj
dotnet publish --configuration Release -p:PublishSingleFile=true --runtime linux-x64 --self-contained Decompiler/Decompiler.csproj
