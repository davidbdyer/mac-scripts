#!/usr/bin/osascript


# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Apache Restart
# @raycast.mode compact
#
# Optional parameters:
# @raycast.packageName Apache
# @raycast.icon ??
#
# Documentation:
# @raycast.description Restarts Apache Server
# @raycast.author David Dyer
# @raycast.authorURL https://www.daviddyer.me

set userName to (do shell script "whoami")
set userPassword to "rockodbot"

try
	do shell script "sudo apachectl restart" user name userName password userPassword with administrator privileges
	do shell script "echo Apache Restarted"
on error errorMessage
	do shell script "echo 'Apache Restart Failed'"
end try