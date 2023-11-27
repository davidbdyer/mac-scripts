tell application "System Events"
	set launchRead to (do shell script "launchctl list | grep -i gopro | awk '{print $3}'" with administrator privileges)
	set loginItemList to (get the name of every login item)
	
	#if only launch enabled, disable launch
	if (loginItemList does not contain "GoPro Webcam") and (launchRead is equal to "com.gopro.GoProWebcamDaemon") then
		do shell script "launchctl unload -w /Library/LaunchDaemons/com.gopro.GoProWebcamDaemon.plist" with administrator privileges
	end if
	
	#if only login enabled, disable login
	if (loginItemList contains "GoPro Webcam") and (launchRead is not equal to "com.gopro.GoProWebcamDaemon") then
		delete login item "GoPro Webcam"
	end if
	
	#disable
	if (loginItemList contains "GoPro Webcam") and (launchRead is equal to "com.gopro.GoProWebcamDaemon") then
		display dialog "GoPro Webcam Enabled" buttons {"Cancel", "Disable"} default button 1
		if the button returned of the result is "Disable" then
			delete login item "GoPro Webcam"
			do shell script "launchctl unload -w /Library/LaunchDaemons/com.gopro.GoProWebcamDaemon.plist" with administrator privileges
			display dialog "Go Pro Disabled" buttons {"OK"} default button 1
		end if
	end if
	
	#enable
	if (loginItemList does not contain "GoPro Webcam") and (launchRead is not equal to "com.gopro.GoProWebcamDaemon") then
		display dialog "GoPro Webcam Disabled" buttons {"Cancel", "Enable"} default button 1
		if the button returned of the result is "Enable" then
			make login item at end with properties {name:"GoPro Webcam", path:"/Applications/GoPro Webcam.app", hidden:false}
			do shell script "launchctl load -w /Library/LaunchDaemons/com.gopro.GoProWebcamDaemon.plist" with administrator privileges
			display dialog "Go Pro Enabled" buttons {"OK"} default button 1
		end if
		
	end if
end tell
