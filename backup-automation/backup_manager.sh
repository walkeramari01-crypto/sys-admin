# This script creates a compressed backup of a source directory,
# stores it in a destination folder, and deletes backups older than 7 days.

#!/usr/bin/env bash

set -euo pipefail

# ===== Variables =====
# Define source and destination directories for backup
SOURCE_DIR="$(pwd)/source_data"
DEST_DIR="$(pwd)/backups"

# Define log file and timestamp for naming backups
LOG_FILE="$DEST_DIR/backup.log"
TIMESTAMP="$(date +%F)"
ARCHIVE_NAME="backup_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$DEST_DIR/$ARCHIVE_NAME"

# ===== Ensure destination exists =====
mkdir -p "$DEST_DIR"

# ===== Start logging =====
echo "Backup started at $(date)" >> "$LOG_FILE"

# ===== Validate source directory =====
if [ ! -d "$SOURCE_DIR" ]; then
  echo "ERROR: Source directory not found" >> "$LOG_FILE"
  exit 1
fi

# ===== Create compressed backup =====
# -c = create archive, -z = gzip compression, -f = file name
tar -czf "$ARCHIVE_PATH" -C "$SOURCE_DIR" .

# ===== Log success =====
echo "Backup created: $ARCHIVE_PATH" >> "$LOG_FILE"

# ===== Rotation: remove backups older than 7 days =====
# -mtime +7 means older than 7 days
find "$DEST_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -delete

echo "Old backups removed" >> "$LOG_FILE"
echo "Backup completed at $(date)" >> "$LOG_FILE"
