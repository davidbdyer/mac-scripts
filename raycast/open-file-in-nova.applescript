#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open File In Nova
# @raycast.mode compact

# Optional parameters:
# @raycast.icon images/nova.png
# @raycast.packageName Nova

# Documentation:
# @raycast.description Open files in Nova.
# @raycast.author David Dyer
# @raycast.authorURL https://www.daviddyer.me

tell application "Finder"
	# Check if there's a selection; works if there's a window open or not.
	if selection is not {} then
		set i to item 1 of (get selection)
		
		# If it's an alias, set the item to the original item.
		if class of i is alias file then
			set i to original item of i
		end if
		
		set p to i
		
	end if
end tell

do shell script "open -a nova " & quoted form of POSIX path of (p as alias)

