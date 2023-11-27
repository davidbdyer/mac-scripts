-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Get Apache servie status.

set userName to (do shell script "whoami")
set userPassword to "password"

set readResult to do shell script "sudo launchctl list | grep apache | awk '{print $3}'" user name userName password userPassword with administrator privileges

if readResult is equal to "org.apache.httpd" then
	display dialog "Apache Enabled" buttons {"OK"} default button 1
else
	display dialog "Apache Disabled" buttons {"OK"} default button 1
end if