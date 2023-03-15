#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Site Subfolder URL
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📁
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Creates URL for Sites subfolder.
# @raycast.author David Dyer
# @raycast.authorURL https://github.com/davidbdyer

path=$(osascript <<'EOF'
    tell application "Finder"
        set theSelection to selection
        if theSelection is {} then
            if exists Finder window 1 then
                get the POSIX path of (target of Finder window 1 as alias)
            end if
        else
            get the POSIX path of (theSelection as alias)
        end if
    end tell
EOF
)



users="/Users/"
currentUser=$(whoami)
sites="/Sites/"
checkPath=$users$currentUser$sites*

if [[ $path == $checkPath ]]; then

    urlStart=$(echo "http://localhost/~david/")
    urlEnd=$(echo $path | tr -d '\n' | cut -c20-)
    echo $urlStart$urlEnd | pbcopy
    echo "Copied $urlStart$urlEnd to clipboard"
    open $urlStart$urlEnd
else
    echo "Finder window outside of sites folder."
    echo "Copied $urlStart to clipboard"
fi