tell application "Pages"
	activate
	set thisDocument to make new document
	tell thisDocument
	set body text to "{popclip text}"
	end tell
end tell