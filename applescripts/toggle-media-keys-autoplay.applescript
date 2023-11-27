-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Disable autoplay associated with Bluetooth headphones. It also disables the media keys.
-- So far, I don't know of a way to disable the autoplay without disabling the media keys.

do shell script "read=`launchctl list | grep -i com.apple.rcd | awk '{print $3}'`

if 
	[[ $read == com.apple.rcd ]]; 
then
	launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
else
	launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
fi
"