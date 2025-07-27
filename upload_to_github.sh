#!/bin/bash

# Initialize a new Git repository
git init

# Add all files to the repository
git add .

# Commit the files
git commit -m "Initial commit of the Performance Monitor project"

# Add the remote repository
git remote add origin https://github.com/Abdullah-dev99/Performance_Tab.git

# Push the files to the remote repository
git push -u origin master
