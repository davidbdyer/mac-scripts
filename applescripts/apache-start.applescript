-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Starts Apache service.

set userName to (do shell script "whoami")
set userPassword to "password"

do shell script "sudo apachectl start" user name userName password userPassword with administrator privileges