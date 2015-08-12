This document provides detailed step-by-step instructions on forking GsDevKit, cloning to 
your local server, creating a branch, and how to commit and update.  

Github and git provide many options and this is not the only way to perform these tasks; these instructions
are provided as a convenience for people getting started with github. 

###Log into your github account
[log in to github][1].  If you don't have a github account, you can create a free account here: [join github][2].

###Fork the GsDevKit project on github.

[Fork the GsDevKit project] [4] to your account.  

###Setup your SSH credentials

You may clone using https://github.com/GsDevKit/gsDevKitHome.git, but this creates issues later.

##Clone your GsDevKit fork
On your local GemStone development server, clone your GsDevKit fork. 

```Shell
git clone git@github.com:<yourAccountName>/gsDevKitHome.git  
```
  
##Create a branch for your work

You will create a unique branch for your work, to keep your in-progress work separate from your main codebase.  You may create several branches that you can merge into your fork when they are ready.

```Shell
cd gsDevKitHome
git checkout -b  <your_branch_name>
```

To ensure that this branch is visible on github, perform the synchronization:

```
git push origin <your_branch_name>
```  

###Set your default branch
On your github settings page, (https://github.com/<yourAccountName>/gsDevKitHome/settings), set the default branch for your account to your new branch. 

###Work on your code

You are now ready to work on code!  

These instructions do not cover all you need to know about using git for managing code, but a few tips: 

To commit changes in your local checkout to the github branch:
```
git commit -a -m "checkin comment"
git push origin <your_branch_name>
```
To update your local checkout from the github branch:
```
git pull origin <your_branch_name>
```

[1]: https://github.com/login
[2]: https://github.com/
[3]: https://github.com/GsDevKit/gsDevKitHome
[4]: https://github.com/GsDevKit/gsDevKitHome/fork
