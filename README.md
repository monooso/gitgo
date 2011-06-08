# GitGo #
Bash script to initialise a new Git project. Performs the following steps:

1. Runs `git init`.
2. Adds all files to the repo.
3. Creates an "initial commit".
4. Creates a "0.1.0" tag.
5. Runs `git flow init`.
6. Prompts the user for a remote git repository address.
7. Sets the remote origin.
8. Pushes the master branch, and sets it to track `origin/master`.
9. Pushes the develop branch, and sets it to track `origin/develop`.
10. Pushes the 0.1.0 tag.
