#!/bin/bash

# Define backup file name and directory
BACKUP_DIR="/opt/backups"
BACKUP_FILE="${BACKUP_DIR}/db_backup_$(date +%F_%H-%M-%S).sql"

# Perform the backup
PGPASSWORD="passwd" pg_dump -U user -F c database > "$BACKUP_FILE"

# Optionally, you can compress the backup file
gzip "$BACKUP_FILE"
