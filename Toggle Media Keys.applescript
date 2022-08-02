do shell script "read=`launchctl list | grep -i com.apple.rcd | awk '{print $3}'`

if 
	[[ $read == com.apple.rcd ]]; 
then
	launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
else
	launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
fi
"