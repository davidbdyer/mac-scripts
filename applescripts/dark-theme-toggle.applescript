-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Toggle between Mac OS light and dark theme.

tell application "System Events"
	tell appearance preferences
		set dark mode to not dark mode
	end tell
end tell
