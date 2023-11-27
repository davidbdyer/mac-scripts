set userName to (do shell script "whoami")
set userPassword to "password"
set siteFolder to (do shell script "whoami")


tell application "System Events"
	set launchRead to (do shell script "sudo launchctl list | grep apache | awk '{print $3}'" user name userName password userPassword with administrator privileges)
	if launchRead is equal to "org.apache.httpd" then
		display dialog "Web Server Enabled, Disable?" buttons {"No", "Disable", "Open in Browser"} default button 3
		if the button returned of the result is "Disable" then
			(do shell script "sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist" user name userName password userPassword with administrator privileges)
			set result to (do shell script "sudo launchctl list | grep apache | awk '{print $3}'" user name userName password userPassword with administrator privileges)
			if result is equal to "org.apache.httpd" then
				display dialog "Failed to Disable" buttons {"OK"} default button 1
			else
				display dialog "Web Server Disabled" buttons {"OK"} default button 1
			end if
		else if the button returned of the result is "Open in Browser" then
			do shell script "open http://localhost/~" & siteFolder
			do shell script "echo http://localhost/~" & siteFolder & " | pbcopy"
		else
			return
		end if
	else
		display dialog "Web Server Disabled, Enable?" buttons {"No", "Enable"} default button 2
		if the button returned of the result is "Enable" then
			(do shell script "sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist" user name userName password userPassword with administrator privileges)
			set result to (do shell script "sudo launchctl list | grep apache | awk '{print $3}'" user name userName password userPassword with administrator privileges)
			if result is not equal to "org.apache.httpd" then
				display dialog "Failed to Enable" buttons {"OK"} default button 1
			else
				display dialog "Web Server Enabled, Open in Browser?" buttons {"Yes", "No"} default button 2
				if the button returned of the result is "Yes" then
					do shell script "open http://localhost/~" & siteFolder
				else
					return
				end if
			end if
		else
			return
		end if
	end if
end tell