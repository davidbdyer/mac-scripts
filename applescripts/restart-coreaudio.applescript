-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Restart Coreaudio System.

set userName to (do shell script "whoami")
set userPassword to "password"

tell application "System Events"
	do shell script "sudo launchctl stop com.apple.audio.coreaudiod && sudo launchctl start com.apple.audio.coreaudiod" user name userName password userPassword with administrator privileges
end tell
