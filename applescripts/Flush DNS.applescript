set userName to (do shell script "whoami")
set userPassword to "password"

tell application "System Events"
	do shell script "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder" user name userName password userPassword with administrator privileges
	display dialog "DNS cache flushed" buttons {"OK"} default button 1
end tell
