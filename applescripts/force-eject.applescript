-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Force Eject a disk.

tell application "Finder" to set diskNames to name of every disk whose name is not in {"vm", "home", "Preboot", "Recovery", "Update"}

set diskToEject to choose from list diskNames with prompt "Select Disk to Force Eject"

if diskToEject is equal to false then
	error number -128
else
	display dialog "" & diskToEject & " Will Be Ejected" buttons {"Proceed", "Abort"} default button 2
	if the button returned of the result is "Proceed" then
		do shell script "diskutil unmountDisk force /Volumes/" & diskToEject
	else
		-- action for 2nd button goes here
	end if
end if


