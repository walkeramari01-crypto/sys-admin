#!/bin/bash
# This script recovers the TopSecret folder from the hidden macOS Trash directory

# Navigate to the hidden Trash folder
cd ~/.Trash

# List all files, including hidden files
ls -la

# Create a Recovery folder on the Desktop
mkdir -p ~/Desktop/Recovery

# Move the TopSecret folder out of Trash
mv TopSecret ~/Desktop/Recovery/
