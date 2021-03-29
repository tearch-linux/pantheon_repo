#!/bin/bash
#set -e

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

./x86_64/update.sh

# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "Write your commit comment!"

read input

# Committing to the local repository with a message containing the time details and commit text
git commit -m "$input"

# Push the local files to github
git push

echo "###################    Git Push Done      ######################"