#!/bin/bash

#
# Script to initialise a new Git project. Performs the following steps:
# 1. Runs git init.
# 2. Adds all files to the repo.
# 3. Creates an "initial commit".
# 4. Creates a '0.1.0' tag if instructed
# 5. Runs git flow init if instructed
# 6. Prompts the user for a remote git repository address if necessary
# 7. Sets the remote origin if instructed
# 8. Pushes the develop branch, and sets it to track origin/develop.
# 9. Pushes the master branch, and sets is to track origin/master.
# 10. Pushes the tag if necessary
#


while getopts "fr:t:" Option
do
  case $Option in
    f ) FLOW=1;;
    r ) REMOTE=${OPTARG};;
    t ) TAG=${OPTARG};;
  esac
done


#
# Initialise the git repository.
#
echo "----------------------------------------"
echo "Initialising git repository..."
echo "----------------------------------------"
git init
git add .
git commit -m "Initial commit."


#
# Tag the release.
#
if [ $TAG ]; then
    git tag $TAG -m "Version $TAG"
fi


if [ $FLOW ]; then
    #
    # Initialise git flow. User is prompted for branch names.
    #
    echo "----------------------------------------"
    echo "Initialising git flow..."
    echo "----------------------------------------"
    git flow init
fi

if [ -n "$REMOTE" ]; then
    echo "----------------------------------------"
    echo "Pushing to remote repository..."
    echo "----------------------------------------"
    git remote add origin "$REMOTE"
    git checkout master
    git push -u origin master
    if [ $TAG ]; then
        git push --tags
    fi
    git checkout develop
    git push -u origin develop
fi








# While loop should set bash variables and all actual actions and echos should occur after while loop is complete.
# sudo rm -r -v .git/
# ../gitgo/gitgo.sh -f -t 0.0.1 -r git@github.com:erikreagan/testingscript.git
# http://tldp.org/LDP/abs/html/string-manipulation.html#GETOPTSIMPLE
# http://aplawrence.com/Unix/getopts.html
# http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html
# https://github.com/experience/gitgo/blob/master/gitgo.sh