# A Tutorial for Basic Git Actions
To get started, fork this repository to your own account by clicking the fork button in the top right corner. This creates a separate copy on your own account that you can edit without impacting the original.

## Setting up Git in the command line
*If you've already set up Git on your local system you can skip to the next section.*

First, run these commands to set up your user on the local system.
```
git config --global user.name "your GitHub username"
git config --global user.email "your GitHub email"
```
Next you'll need to connect your local Git account to your GitHub account. We'll do this with an SSH key. More details on this process are on [GitHub's official documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).
Run the below command to generate an SSH key and copy the output to your clipboard
```
ssh-keygen -t ed25519 -C "your GitHub email"
```
Next navigate to your GitHub account and go to Settings > SSH and GPG Keys. Create a new key and paste the previously copied output here.
Hooray! Git and GitHub are now linked allowing you to push and pull code from your cloud repositories to your local system.
You can test whether or not it worked with
```
ssh -T git@github.com
```

## Cloning a repository
We can now get started working with a repository. On the home page of your forked repository, click the green Code button and copy the git url.
Now go back to the command line and find a directory where you'd like to store the code locally and run the below command to clone the repository.
```
git clone git@github.com:tnaren97/Github-Tutorial.git
```
You'll see that a copy of the repository is now stored in your local folder. Each of the three files in this repo just contain some basic text while main.sh is a bash script that prints the contents of each of the text files. You can run it with 
```
./main.sh
```
You might also need to run ```chmod +x main.sh``` to make it executable first.

## Working With Branches
Run
```git branch```
to list all branches currently on the system. Your current branch will have an * in front of it. 
### A primer on branches
The ```main``` branch is the primary code base. You generally don't want to make changes to this branch as it's expected to be bug free and working properly. However, if you do want to add new features or fix some bugs, the best way to do so is to make a new branch. Branching creates a separate version of the code base allowing you to modify it without affecting the original. However, the cool thing about Git is that this copy is kept in-place. That means if you make 6 branches you aren't making 6 different copies of each file but instead have only 1 copy and are tracking the changes that differ between each version of that file. Git has something called ```HEAD``` (stored in the ```.git``` folder) that acts as a pointer to the current branch. Everytime you switch branches, this pointer updates to point to the new branch. Git will automatically modify all the files in the directory to apply any changes associated with the branch ```HEAD``` is pointing to. If you want to see where the ```HEAD``` is currently pointing to run 
```
cat .git/HEAD
```
You should see HEAD is currently pointing to ```main```.
### Making branches
You can switch to a new branch using 
```
git checkout "branch name"
```
but you don't have any branches at the moment. While you can create a new branch with 
```
git checkout -b "new branch name"
```
for the moment we'll just switch to a branch that I've already created and saved upstream in the cloud. Run
```
git branch -a
```
to list all branches, local and remote. You'll see your local ```main``` branch as well as branches that start with ```remotes/origin```. These are the remote branches stored on GitHub. You'll also see the remote HEAD which is pointing to the remote ```main``` branch. To download a remote branch, run 
```
git checkout "name of remote branch"
```
You will now have the changes from the remote branch synced to a local branch of the same name. You might also notice the files in this branch are different and that there's now a fourth text file. If you switch back to ```main``` you'll see the fourth file disappeared indicating it's only present in ```branch2```. Run ```./main.sh``` in both of these branches and compare the outputs. This is an example of how Git is modifiying files in place to keep up with different branches.
## Making commits
Let's get started with making commits. First let's make a new branch for your changes. Run 
```
git checkout -b "new branch name"
```
and name the branch whatever you like. Now you can make changes to any file without fear of messing anything up. To start with, why not make a new file? Run
```touch file5.txt```
to create a new file. Use ```nedit file5.txt``` to bring up an editor to type in whatever you want. When done, save and quit. Now we want to save the changes we made to this code base. To do this we need to stage our changes. Run
```
git add file5.txt
```
to stage the changes we made to that file (alternatively you can use ```git add . ``` to stage any changes made to all files in this directory). You can stage as many changes as you want though it's usually best practice to stage related changes together to include in a single commit. You can check all the staged changes with
```
git status
```
Now we can commit these staged changes with
```
git commit -m "commit message"
```
All commits require a commit message. If you don't include the -m flag it'll prompt you in the command line anyway.
Let's make another commit while we're at it. Modify file1.txt with nedit and replace the contents with whatever phrase you want. Stage and commit the changes as done previously.
## Merging branches
Now say we want to merge our new branch back into main because we're satisfied with the changes we've made. Merging is as simple as checking out back to main and running
```git merge "new branch name"```
However, if you try this you'll get an error saying "Merge conflict". Essentially, Git has conflicting changes for two versions of the same file and doesn't know which one to keep so it does nothing. It's up to you to fix the merge conflict. The best way to do this is use an IDE like Visual Studio Code to inspect each of the merge conflicts side-by-side and accept or reject changes for each one. Once all conflicts are fixed, you can run the command again to merge the branches.
## Pushing and pulling
All of the changes we've made so far have been local, i.e., we haven't affected anything in the remote repository. That's where pushing and pulling come in. ```git push``` is used to sync changes from your local repository to the remote repository while ```git pull``` does the opposite. It's important to push changes every so often both to back up to all your commits and also so other people can see the status of your work. Vice versa, if an update happens upstream to a branch you're working on, you'll want to ```git pull``` to sync the new changes to your local copy. You might even have to handle some merge conflicts.

### Pushing
Let's try out pushing your code to GitHub. Switch to the branch you made and run 
```
git push
```
Now navigate to the website and refresh your page. You might see a new notifaction asking for a pull request. We'll come back to that in a minute. Click the drop down next to main. This lists all the branches in this project. Your new branch should now be listed there.
### Pulling
Now let's try making changes to the remote repository and pulling that locally. On the homepage for your GitHub repository, switch to the branch you made. Pick one of the text files and edit it using the website's built in text editor. Now go back to the command line and switch to the same branch. Run 
```
git pull
```
to download the changes and automatically merge them into your local branch. Alternatively, you can also use 
```
git fetch
```
to download the changes without merging them into your local branch. This is great if you want to pick and choose what commits you merge in.
## Miscellaneous
### gitignore
If there are files you don't want Git to track (say log files or build outputs from compilation), you can use a gitignore file to whitelist them from Git. Simply make the file by running 
```
touch .gitignore
```
in the root of your repository and then add the files or folders you don't want tracked to it.
### Commit history
You can use 
```
gitk --all
```
to bring up a GUI showing commit history for a repository.
### IDEs
IDEs like Visual Studio Code have a lot of built in functionality to make Git management easy. Alternatively you can use something like GitHub Desktop to make things simpler (works best for Windows where the command line is kind of messy)
to bring up a graphical interface
