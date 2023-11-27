#!/usr/bin/osascript


# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Apache Restart
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ??
# @raycast.packageName Apache Utils
#
# Documentation:
# @raycast.description Restarts Apache Server
# @raycast.author David Dyer
# @raycast.authorURL https://www.daviddyer.me

set userName to (do shell script "whoami")
set userPassword to "password"

tell application "System Events"
	do shell script "sudo apachectl restart" user name userName password userPassword with administrator privileges
	display dialog "Apache Restarted" buttons {"OK"} default button 1
end tell
