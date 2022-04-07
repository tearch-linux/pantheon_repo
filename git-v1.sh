#!/bin/bash
#set -e

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

echo "What is your GPG key? (empty: none)"
read gpg_key

rm x86_64/*.pkg.tar.*sig
if ! [[ $gpg_key == "none" ]]; then
    for i in $(ls --ignore="*.sig" --ignore="*.sh" --ignore="*.db*" --ignore="*.files*" x86_64/); do
        gpg --local-user ${gpg_key} --yes --detach-sign --use-agent "x86_64/${i}"
    done
else
    echo "No GPG key entered!"
fi

rm -f x86_64/tearch_repo.*
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
