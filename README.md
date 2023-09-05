# A Tutorial for Basic Git Actions
To get started, fork this repository to your own account by clicking the fork button in the top right corner. This creates a separate copy on your own account that you can edit without impacting the original.

## Setting up Git in the command line.
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
You'll see that a copy of the repository is now stored in your local folder. Each of the three files in this repo just contain some basic text while main.sh is a basic bash script that prints the contents of each of the files.  
```
git branch
```
to list all the branches currently available in your local repo (at the moment, you should only see ```main```).
## Working with branches
The ```main``` branch is the primary code base. You generally don't want to make changes to this branch as it's expected to be bug free and working properly. However, if you do want to add new features or fix some bugs, the best way to do so is to make a new branch. Branching creates a separate version of the code base allowing you to modify it without affecting the original. However, the cool thing about Git is that this copy is kept in-place. That means if you make 6 branches you aren't making 6 different copies of each file but instead have only 1 copy and are tracking the changes that differ between each version of that file. Git has something called ```HEAD``` (stored in the ```.git``` folder) that acts as a pointer to the current branch. Everytime you switch branches, this pointer updates to point to the new branch. The ```HEAD``` will automatically modify all the files in the directory to apply any changes associated with that branch. If you want to see where the ```HEAD``` is currently pointing run 
```
cat .git/HEAD
```
Here you should see HEAD is currently pointing to ```main```. You can also just use ```git branch``` to show the current branch.
You can switch to a new branch using 
```
git checkout "branch name"
```
but you don't have any branches at the moment. You can create a new branch with 
```
git checkout -b "new branch name"
```
however, for the moment we'll just switch to a branch that I've already created and saved upstream in the cloud. Run
```
git branch -a
```
to list all branches, local and remote. You'll see your local ```main``` branch as well as branches that start with ```remotes/origin```. These are the remote branches stored on Github. You'll also see the remote HEAD which is pointing to the remote ```main``` branch. To download a remote branch, run 
```
git checkout "name of remote branch"
```
You will now 
