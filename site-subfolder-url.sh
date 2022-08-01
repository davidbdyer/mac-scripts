#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Site Subfolder URL
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📁

# Documentation:
# @raycast.description Creates URL for Sites subfolder.
# @raycast.author David Dyer
# @raycast.authorURL https://github.com/davidbdyer

path=$(osascript <<'EOF'
    tell application "Finder"
        if exists Finder window 1 then
            get the POSIX path of (target of Finder window 1 as alias)
        else
            get the POSIX path of (desktop as alias)
        end if
    end tell
EOF
)

urlStart=$(echo "http://localhost/~david/")
urlEnd=$(echo $path | tr -d '\n' | cut -c20-)
echo $urlStart$urlEnd | pbcopy
echo "Copied $urlStart$urlEnd to clipboard"
