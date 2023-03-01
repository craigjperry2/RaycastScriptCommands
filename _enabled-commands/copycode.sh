#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Code
# @raycast.mode silent
# @raycast.packageName Messages

# Optional parameters:
# @raycast.icon images/Message.png

# Documentation:
# @raycast.description Copy verification code from a message.
# @raycast.author Fatpandac
# @raycast.authorURL https://github.com/Fatpandac

USERNAME=$(id -u -n)

# Need to give raycast whole disk access
result=$(sqlite3 /Users/$USERNAME/Library/Messages/chat.db 'SELECT text FROM message WHERE datetime(date/1000000000 + 978307200,"unixepoch","localtime") > datetime("now","localtime","-60 second") ORDER BY date DESC LIMIT 1;')


if [[ -z "$result" ]]; then
  echo "No verification code received in the last 60 seconds!"
  exit 0;
fi

code=`echo $result | grep -o "[0-9]\{4,6\}"`;
if [[ -n "$code" ]]; then
  echo "$code" | pbcopy;
  echo "$code code copied!"
fi

