#!/bin/bash

cd "${0%/*}"
. ../common.sh

echo "Processing HL2: EP1..."

ProcessVPK
FixUCS2

CreateCommit "-" "$1"
