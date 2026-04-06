#!/bin/bash

# ============================================================
# daily_update.sh
# Automatically push your latest project changes to GitHub
# Run this every time you finish working for the day
# ============================================================

# Go to the project folder
cd ~/pi-voice-assistant

# Check if there is anything new to upload
if [[ -z $(git status --porcelain) ]]; then
    echo "✅ Nothing new to upload. Everything is already up to date."
    exit 0
fi

# Show what changed
echo "📋 Changes detected:"
git status --short

# Add all changed files
git add .

# Create a commit with today's date and time automatically
TIMESTAMP=$(date "+%Y-%m-%d %H:%M")
git commit -m "Progress update: $TIMESTAMP"

# Push to GitHub
git push origin main

echo ""
echo "✅ Successfully uploaded to GitHub!"
echo "🔗 Your project is updated at your GitHub repository."
