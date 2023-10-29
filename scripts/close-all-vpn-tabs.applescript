tell application "Google Chrome"
	set windowList to every tab of every window whose URL starts with "http://127.0.0.1:35001"
	repeat with tabList in windowList
		set tabList to tabList as any
		repeat with tabItr in tabList
			set tabItr to tabItr as any
			delete tabItr
		end repeat
	end repeat
end tell
