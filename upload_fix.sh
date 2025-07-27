#!/bin/bash

# This script is designed to fix common Git push errors.

# 1. Ensure the main branch is named 'main' to match GitHub's standard.
# This command renames the current branch to 'main'.
git branch -M main

# 2. Add all current files to the staging area.
git add .

# 3. Commit the files if there are any changes.
# This checks if there's anything to commit before trying.
if ! git diff-index --quiet --cached HEAD; then
    git commit -m "Finalize project and prepare for upload"
else
    echo "No new changes to commit. Proceeding to push."
fi

# 4. Set the remote URL for 'origin'.
# This avoids the "remote origin already exists" error by updating the existing remote.
git remote set-url origin https://github.com/Abdullah-dev99/Performance_Tab.git

# 5. Push the 'main' branch to GitHub.
# The -u flag sets the upstream branch, so in the future you can just run 'git push'.
echo "Uploading files to GitHub..."
git push -u origin main

echo "Upload complete!"
