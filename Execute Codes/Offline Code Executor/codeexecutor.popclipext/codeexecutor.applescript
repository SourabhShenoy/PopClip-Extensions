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

display notification newfc & " detected" with title "Offline Code Executor" sound name "/System/Library/Sounds/Pop.aiff"


if newfc is equal to "C" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.c " in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "gcc temp.c" in theTab
		do script "./a.out" in theTab
	end tell
	
else if newfc is equal to "C++" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.cpp" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "g++ temp.cpp" in theTab
		do script "./a.out" in theTab
	end tell
	
else if newfc is equal to "Perl" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.pl" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "perl temp.pl" in theTab
	end tell
	
else if newfc is equal to "Ruby" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.rb" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "ruby temp.rb" in theTab
	end tell
	
else if newfc is equal to "Python" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.py" in theTab
		do script "rm lang.txt lang.txt" in theTab
		do script "clear" in theTab
		do script "python temp.py" in theTab
	end tell
	
else if newfc is equal to "PHP" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.php" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "php temp.php" in theTab
	end tell
	
else if newfc is equal to "Java" then
	
	set fName to the text returned of (display dialog "Please Enter the Public Class name" default answer "" with title "Enter Class Name")
	set newfName to trim(true, fName)
	
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		set theScript to "mv temp.txt " & newfName & ".java"
		do script (theScript) in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		set theScript to "javac " & newfName & ".java"
		do script (theScript) in theTab
		set theScript to "java " & newfName
		do script (theScript) in theTab
		
	end tell
	
else if newfc is equal to "Go" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.go" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "go run temp.go" in theTab
		
	end tell
	
else if newfc is equal to "Scala" then
	set fName to the text returned of (display dialog "Please Enter the Public Class name" default answer "" with title "Enter Class Name")
	set newfName to trim(true, fName)
	
	
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		set theScript to "mv temp.txt " & newfName & ".scala"
		do script (theScript) in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		set theScript to "scalac " & newfName & ".scala"
		do script (theScript) in theTab
		set theScript to "scala " & newfName
		do script (theScript) in theTab
	end tell
	
else if newfc is equal to "Javascript" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.js" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "node temp.js" in theTab
	end tell
	
else if newfc is equal to "Haskell" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.hs" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "ghc temp.hs" in theTab
		do script "./temp" in theTab
		
	end tell
	
else if newfc is equal to "C#" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.cs" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "mcs temp.cs" in theTab
		do script "mono temp.exe" in theTab
		
	end tell
	
else if newfc is equal to "Pascal" then
	tell application "Terminal"
		activate
		if (count of windows) is less than 1 then
			do script ""
		end if
		set theTab to selected tab in first window
		do script "cd $HOME/Desktop" in theTab
		do script "mv temp.txt temp.pas" in theTab
		do script "rm lang.txt" in theTab
		do script "clear" in theTab
		do script "fpc temp.pas" in theTab
		do script "./temp" in theTab
		
	end tell
	
else if newfc is equal to "Clojure" then
	display dialog newfc & " support will be added soon. Stay tuned!"
	--do script "clojure temp.clj" in theTab
	
else if newfc is equal to "Visual Basic" then
	display dialog newfc & " support will be added soon. Stay tuned!"
	
	
else if newfc is equal to "Matlab" then
	display dialog newfc & " support will be added soon. Stay tuned!"
else
	
	display dialog "Language " & newfc & " not supported"
	
end if
