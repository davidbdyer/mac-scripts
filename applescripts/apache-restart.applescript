-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Restarts Apache service.

set userName to (do shell script "whoami")
set userPassword to "password"

tell application "System Events"
	do shell script "sudo apachectl restart" user name userName password userPassword with administrator privileges
end tell