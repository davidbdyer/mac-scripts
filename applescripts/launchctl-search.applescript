set userName to (do shell script "whoami")
set userPassword to "password"

display dialog "Search" default answer "" buttons {"Cancel", "Search"} default button "Search"
copy the result as list to {button_pressed, text_returned}

if button_pressed is not equal to "Cancel" then
	set scriptsToRun to "Launch Agents:" & return & (do shell script "launchctl list | grep -i " & text_returned & "| awk '{print $3}'") & return & return & "Launch Daemons:" & return & (do shell script "launchctl list | grep -i " & text_returned & "| awk '{print $3}'" user name userName password userPassword with administrator privileges)
	display dialog scriptsToRun buttons {"OK", "Save List"} default button 1
	if button returned of result = "Save List" then
		-- saves list to text file on desktop
		display dialog "Save To" default answer "~/Desktop/RunningAgentsDaemons.txt" buttons {"Ok", "Cancel"} default button 1
		copy the result as list to {button_pressed_02, save_path}
		do shell script "echo " & quoted form of scriptsToRun & " > " & save_path
	end if
end if
