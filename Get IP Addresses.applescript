tell application "System Events"
	set ifconfig to do shell script "ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}'"
	display dialog ifconfig buttons {"OK"} default button 1
end tell
