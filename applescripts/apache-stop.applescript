set userName to (do shell script "whoami")
set userPassword to "password"

do shell script "sudo apachectl stop" user name userName password userPassword with administrator privileges