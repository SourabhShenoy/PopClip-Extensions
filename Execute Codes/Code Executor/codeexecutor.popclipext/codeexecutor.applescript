--PopClip Extension developed by Sourabh Shenoy. Contact me at sourabhsshenoy@icloud.com in case of queries, bug reporting, suggestions or collaborations! Happy coding!


tell application "TextEdit"
	activate
	set doc1 to make new document with properties {text:"{popclip text}"}
	save doc1 in file "Macintosh HD:Users:Sourabh:Desktop:temp.txt"
	quit
end tell



tell application "Terminal"
	activate
	if (count of windows) is less than 1 then
		do script ""
	end if
	set theTab to selected tab in first window
	do script "clear" in theTab
	do script "cd $HOME/Library/" in theTab
	do script "cd 'Application Support'" in theTab
	do script "cd PopClip/Extensions/codeexecutor.popclipext/sourceclassifier" in theTab
	do script "bin/lang-detect classify $HOME/Desktop/temp.txt > $HOME/Desktop/lang.txt " in theTab
end tell



delay 1



set theFile to (POSIX file ("/Users/Sourabh/Desktop/lang.txt"))
open for access theFile
set fileContents to (read theFile for 12)
close access theFile

set newfc to trim(true, fileContents)

on trim(theseCharacters, someText)
	if theseCharacters is true then set theseCharacters to {" ", tab, ASCII character 10, return, ASCII character 0}
	
	repeat until first character of someText is not in theseCharacters
		set someText to text 2 thru -1 of someText
	end repeat
	
	repeat until last character of someText is not in theseCharacters
		set someText to text 1 thru -2 of someText
	end repeat
	
	return someText
end trim



if newfc is equal to "C" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.c " in theTab
		do script "rm lang.txt lang.txt" in theTab
		do script "clear" in theTab
		do script "gcc temp.c" in theTab
		do script "./a.out" in theTab
	end tell
	
else
	display dialog "Language " & newfc & " not supported"
	
end if
