#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title SSH into d3.local
# @raycast.mode silent
# @raycast.packageName Terminal

# Optional parameters:
# @raycast.icon images/iterm.png

# Documentation
# @raycast.author Craig Perry

-- Main
on run argv
  tell application "Terminal"
      if not (exists window 1) then reopen

      activate

      delay 0.1

      if busy of window 1 then
          tell application "System Events" to keystroke "t" using command down
      end if

      do script "ssh d3.local" in window 1
  end tell
end run

