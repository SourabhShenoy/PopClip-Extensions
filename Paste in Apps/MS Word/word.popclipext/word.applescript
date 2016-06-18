tell application "Microsoft Word"
	activate
	make new document 
	set myRange to create range active document start 0 end 0
	set content of myRange to "{popclip text}"
end tell