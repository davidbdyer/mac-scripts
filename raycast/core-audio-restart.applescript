#!/usr/bin/osascript


# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Core Audio Restart
# @raycast.mode silent
# @raycast.packageName System Utils
#
# Optional parameters:
# @raycast.icon ??
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Restarts Core Audio
# @raycast.author David Dyer
# @raycast.authorURL https://www.daviddyer.me

set userName to (do shell script "whoami")
set userPassword to "password"

tell application "System Events"
	do shell script "sudo launchctl stop com.apple.audio.coreaudiod && sudo launchctl start com.apple.audio.coreaudiod" user name userName password userPassword with administrator privileges
	display dialog "Core Audio Reloaded" buttons {"OK"} default button 1
end tell

