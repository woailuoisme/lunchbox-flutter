#!/bin/bash

# Simplified GitHub Secrets Setup Script
# Compatible with macOS default Bash (3.2)
set -e

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Check for gh cli
if ! command -v gh &>/dev/null; then
    echo -e "${RED}Error: Please install GitHub CLI (brew install gh)${NC}"
    exit 1
fi

# Define environment files as pairs: "SECRET_NAME:FILE_PATH"
SECRETS=(
    "ENV_DEV:.env.dev"
    "ENV_PROD:.env.prod"
)

echo -e "${GREEN}Syncing environment files to GitHub Secrets...${NC}"

for ENTRY in "${SECRETS[@]}"; do
    NAME="${ENTRY%%:*}"
    FILE="${ENTRY#*:}"
    
    if [[ -f "$FILE" ]]; then
        echo "Setting $NAME from $FILE..."
        gh secret set "$NAME" < "$FILE"
        echo -e "${GREEN}Successfully set $NAME${NC}"
    else
        echo -e "${RED}Skipped: File $FILE not found${NC}"
    fi
done

echo -e "${GREEN}Sync complete!${NC}"
