-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Destructively batch resize a folder of images to specified pixel size.

set rawPath to POSIX path of (choose folder with prompt "Pick the folder containing the files to process:") as string
set foldePath to quoted form of rawPath

display dialog "Max Pixel Length for Longest Side" default answer "600" buttons {"Ok", "Cancel"} default button 1
copy the result as list to {button_pressed, text_returned}

set targetSize to text_returned as number

tell application "System Events"
	do shell script "sips -Z " & targetSize & " " & foldePath & "*.png"
	do shell script "sips -Z " & targetSize & " " & foldePath & "*.jpg"
end tell