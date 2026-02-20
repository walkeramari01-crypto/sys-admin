# Terminal Undelete Challenge

This project demonstrates how deleted files on macOS are moved to a hidden Trash directory rather than being permanently erased.

## Description
A Bash script is used to navigate the hidden Trash directory, list hidden files, and recover a deleted folder back to the Desktop.

## How to Use
1. Create a folder named TopSecret and a text file using Terminal.
2. Move the folder to the Trash.
3. Run the recovery script:
   ./recover.sh
4. The folder will be restored to ~/Desktop/Recovery.

## Notes
This demonstration uses the internal macOS Trash directory (~/.Trash).  
External USB drives store deleted files in /Volumes/DRIVENAME/.Trashes/UID.

