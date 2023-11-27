set sourceFolder to (choose folder with prompt "Set Source:") as string

set targetFolder to (choose folder with prompt "Set Destination:") as string

display dialog "Proceed with Sync?
" & sourceFolder & " 
" & targetFolder buttons {"Cancel", "Sync"} default button "Cancel"

if button returned of result is "Sync" then
	do shell script "rsync -vaE --delete " & quoted form of POSIX path of sourceFolder & " " & quoted form of POSIX path of targetFolder
end if