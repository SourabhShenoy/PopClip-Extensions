tell application "TextEdit"
	activate
	set doc1 to make new document with properties {text:"{popclip text}"}
	save doc1 in file "Macintosh HD:Users:Sourabh:Desktop:temp.c"
	quit
end tell

tell application "Terminal"
	activate
	if (count of windows) is less than 1 then
		do script ""
	end if
	set theTab to selected tab in first window
	do script "cd Desktop" in theTab
	do script "gcc temp.c" in theTab
	do script "./a.out" in theTab
end tell
