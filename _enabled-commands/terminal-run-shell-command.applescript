#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run Shell Command in Terminal
# @raycast.mode silent
# @raycast.packageName Terminal

# Optional parameters:
# @raycast.icon images/iterm.png
# @raycast.argument1 { "type": "text", "placeholder": "shell command" }

# Documentation
# @raycast.author Craig Perry

-- Main
on run argv
  tell application "Terminal"
      if not (exists window 1) then reopen

      activate

      if busy of window 1 then
          tell application "System Events" to keystroke "t" using command down
      end if

      do script argv in window 1
  end tell
end run

