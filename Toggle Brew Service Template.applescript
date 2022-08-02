set serviceName to "mysql"
set serviceNameForDialog to "MySQL"

tell application "System Events"
	set serviceStatus to (do shell script "/usr/local/bin/brew services | grep mysql | awk '{print $2}'")
	
	if (serviceStatus is "started") then
		display dialog serviceNameForDialog & " is enabled, disable?" buttons {"Leave Enabled", "Disable"} default button 2
		if the button returned of the result is "Disable" then
			do shell script "/usr/local/bin/brew services stop " & serviceName
			set serviceCheck to (do shell script "/usr/local/bin/brew services | grep mysql | awk '{print $2}'")
			if (serviceCheck is "started") then
				display dialog "Service Failed to stop" buttons {"OK"} default button 1
			else
				display dialog "Service stopped" buttons {"OK"} default button 1
			end if
		end if
	else
		display dialog serviceNameForDialog & " is disabled, enable?" buttons {"Leave Disable", "Enable"} default button 2
		if the button returned of the result is "Enable" then
			do shell script "/usr/local/bin/brew services start " & serviceName
			set serviceCheck to (do shell script "/usr/local/bin/brew services | grep mysql | awk '{print $2}'")
			if (serviceCheck is "none") then
				display dialog "Service Failed to start" buttons {"OK"} default button 1
			else
				display dialog "Service started" buttons {"OK"} default button 1
			end if
		end if
	end if
end tell