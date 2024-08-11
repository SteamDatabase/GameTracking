#!/bin/bash

set -euo pipefail

find . -maxdepth 2 -name "update.sh" -exec bash "{}" no-git \;
