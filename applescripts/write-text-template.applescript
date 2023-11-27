-- author:  David Dyer
-- authorURL:  https://www.daviddyer.me
-- description: Automate the writing of text. I usually use it for passwords. That is not a good idea security-wise.

set textString to "asdsfdasdfasfasdfsafa"
set pauseBetweenCharacters to 0.1

tell application "System Events"
	set textBuffer to textString
	repeat with i from 1 to count characters of textBuffer
		keystroke (character i of textBuffer)
		delay pauseBetweenCharacters
	end repeat
end tell