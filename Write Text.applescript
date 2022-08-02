set textString to "asdsfdasdfasfasdfsafa"
set pauseBetweenCharacters to 0.1

tell application "System Events"
	set textBuffer to textString
	repeat with i from 1 to count characters of textBuffer
		keystroke (character i of textBuffer)
		delay pauseBetweenCharacters
	end repeat
end tell