#!/bin/sh
set -e

# Path to the target script
SCRIPT_PATH="/usr/bin/auto_uvc.sh"

# Flag to search for and new value
FLAG="MAIN_PIC_FPS"
NEW_VALUE="30"

# Check if the script exists
if [ ! -f "$SCRIPT_PATH" ]; then
  echo "Script not found: $SCRIPT_PATH"
  exit 1
fi

# Use sed to replace the flag value with the new value
sed -i "/$FLAG/c\\$FLAG=$NEW_VALUE" "$SCRIPT_PATH"

echo "Flag '$FLAG' has been updated to $NEW_VALUE in $SCRIPT_PATH"