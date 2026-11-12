#!/bin/bash
set -e

echo "Starting vowel frequency analyzer..."

FILE="${FILE:-data.txt}"
FREQ_RESULT=$(python3 /app/.github/scripts/frequency.py "$FILE")
echo "Result: $FREQ_RESULT"

bash /app/.github/scripts/update_readme.sh "$FREQ_RESULT" "${GITHUB_USER:-unknown}"

echo "Analysis complete, README updated."
