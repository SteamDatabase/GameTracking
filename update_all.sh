#!/bin/bash

export LC_ALL=C

cd "${0%/*}" || exit 1

find . -maxdepth 2 -name "update.sh" -exec bash "{}" no-git \;
