# GitGo #

Bash script to initialise a new Git project. Performs the following steps:

1. Runs `git init`.
2. Adds all files to the repo.
3. Creates an "initial commit".
4. Creates a tag if argument is passed.
5. Runs `git flow init` if -f option is passed.
6. Checks if remote origin argument was passed. If so then:
7. Sets the remote origin.
8. Pushes the master branch, and sets it to track `origin/master`.
9. Pushes the develop branch, and sets it to track `origin/develop`.
10. Pushes the tag if created.


# Usage #

`gitgo.sh [-f] [-t=INITIAL_TAG] [-r=REMOTE_REPO]`

**`-f`**

Indicates the intent to use git flow

**`-t`**

Indicates the intent to tag your repo state. Pass the tag value to this argument.

**`-r`**

Pass your remote repository path to this argument.

Sample Command
--------------

`gitgo.sh -f -t 0.1 -r git@github.com:erikreagan/gitgo.git`


# Notes #

* GitGo currently assumes that you do not deviate from the git-flow default branch names of "master" and "develop"
* You can alternatively move the script into your $PATH for easier access