#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Package Info
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.packageName Brew
# @raycast.icon 🍺
# @raycast.needsConfirmation true
# @raycast.argument1 {"type": "text", "placeholder": "Package name"}
#
# Documentation:
# @raycast.description Gets info for specified brew package.
# @author David Dyer
# @authorURL https://www.daviddyer.me

if ! command -v brew &> /dev/null; then
  echo "brew command is required (https://brew.sh).";
  exit 1;
fi

brew info $1
