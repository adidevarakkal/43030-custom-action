#!/bin/bash
set -e

FREQ_RESULT="$1"     # vowel frequency result from frequency.py
GITHUB_USER="$2"     # GitHub username of the contributor
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo -e "\n- **${TIMESTAMP}** | pushed by **${GITHUB_USER}** | vowel frequency in data.txt: ${FREQ_RESULT}" >> README.md

git config --global user.name "github-actions"
git config --global user.email "github-actions@users.noreply.github.com"
git config --global --add safe.directory /app

git add README.md
git commit -m "Update README with vowel frequency for ${GITHUB_USER}" || echo "No changes to commit"

# Push only when running in the pipeline (token and repository are passed in by ci.yml)
if [ -n "$GITHUB_TOKEN" ] && [ -n "$GITHUB_REPOSITORY" ]; then
  git config --local --unset-all http.https://github.com/.extraheader || true
  git remote set-url origin "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}"
  git push origin HEAD:main
else
  echo "No GITHUB_TOKEN set, skipping push (local run)."
fi
