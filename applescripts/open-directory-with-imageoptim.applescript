-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Open folder with ImageOptim app. https://imageoptim.com/mac

set this_folder to quoted form of POSIX path of (choose folder with prompt "Pick the folder containing the files to process:") as string
tell application "System Events"
	do shell script "open -a ImageOptim " & this_folder
end tell