-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Toggle the Apache service between running and stopped.

set userName to (do shell script "whoami")
set userPassword to "password"

do shell script "read=`sudo launchctl list | grep apache | awk '{print $3}'`

if 
	[[ $read == *'org.apache.httpd'* ]]; 
then
	sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
	else
	sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist
	sleep 2
	open http://localhost/~david
fi
" user name userName password userPassword with administrator privileges