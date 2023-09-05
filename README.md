# A tutorial for basic Git actions
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
