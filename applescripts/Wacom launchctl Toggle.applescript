do shell script "read=`launchctl list | grep wacom`

if 
	[[ $read == *'com.wacom'* ]]; 
then
	launchctl unload -w /Library/LaunchAgents/com.wacom.wacomtablet.plist;
	launchctl unload -w /Library/LaunchAgents/com.wacom.DataStoreMgr.plist;
	launchctl unload -w /Library/LaunchDaemons/com.wacom.UpdateHelper.plist;
	launchctl unload -w /Library/LaunchDaemons/com.wacom.displayhelper.plist
else
	launchctl load -w /Library/LaunchAgents/com.wacom.wacomtablet.plist;
	launchctl load -w /Library/LaunchAgents/com.wacom.DataStoreMgr.plist;
	launchctl load -w /Library/LaunchDaemons/com.wacom.UpdateHelper.plist;
	launchctl load -w /Library/LaunchDaemons/com.wacom.displayhelper.plist 
fi
" with administrator privileges

do shell script "read=`launchctl list | grep wacom`

if 
	[[ $read == *'com.wacom'* ]]; 
then
	launchctl unload -w /Library/LaunchAgents/com.wacom.wacomtablet.plist;
	launchctl unload -w /Library/LaunchAgents/com.wacom.DataStoreMgr.plist;
	launchctl unload -w /Library/LaunchAgents/com.wacom.IOManager.plist;
	killall WacomTouchDriver
	
else
	launchctl load -w /Library/LaunchAgents/com.wacom.wacomtablet.plist;
	launchctl load -w /Library/LaunchAgents/com.wacom.DataStoreMgr.plist;
	launchctl load -w /Library/LaunchAgents/com.wacom.IOManager.plist 
fi
"