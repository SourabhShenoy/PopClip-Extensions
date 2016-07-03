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

on checkForLoading()
	tell application "Safari" to set safariLoading to loading of currentTab
	repeat while safariLoading = true
		delay 1
		tell application "Safari" to set safariLoading to loading of currentTab
	end repeat
end checkForLoading


tell application "Terminal"
	activate
	if (count of windows) is less than 1 then
		do script ""
	end if
	set theTab to selected tab in first window
	do script "clear" in theTab
	do script "cd $HOME/Desktop/" in theTab
	do script "rm lang.txt temp.txt" in theTab
	quit
end tell

set newProg to trim(true, "{popclip text}")

if newfc is equal to "C" then
	tell application "Safari"
		activate
		tell window 1
			set currentTab to (make new tab with properties {URL:"https://ideone.com"})
			set current tab to currentTab
			checkForLoading()
			tell application "System Events"
				keystroke "a" using command down
				delay 0.2
				tell application "System Events" to key code 51
				keystroke "//Trying to run the C Program. Developer: Sourabh S. Shenoy (sourabhsshenoy@icloud.com)"
				keystroke "{popclip text}"
				delay 1
				--		keystroke return using {command down}
			end tell
		end tell
	end tell
	
else if newfc is equal to "C++" then
	tell application "Safari"
		activate
		tell window 1
			set currentTab to (make new tab with properties {URL:"https://ideone.com"})
			set current tab to currentTab
			delay 2
			tell application "System Events"
				keystroke "a" using command down
				delay 0.2
				tell application "System Events" to key code 51
				--	keystroke "//Trying to run the C++ Program. Developer: Sourabh S. Shenoy (sourabhsshenoy@icloud.com)"
				--	keystroke return
				delay 1
				keystroke "{popclip text}"
				(*				keystroke tab using {option down}
				tell application "System Events" to key code 125
				tell application "System Events" to key code 125
				tell application "System Events" to key code 125
				tell application "System Events" to key code 125
				tell application "System Events" to key code 125
				tell application "System Events" to key code 125
				tell application "System Events" to key code 125
				tell application "System Events" to key code 125
				
	*)
			end tell
		end tell
	end tell
	
else
	display dialog newfc & " support will be added soon. Stay tuned!"
end if