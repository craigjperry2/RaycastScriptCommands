#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search in Amazon
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/amazon.png
# @raycast.argument1 { "type": "text", "placeholder": "query", "percentEncoded": true }

open "https://www.amazon.co.uk/s?k=$1"

