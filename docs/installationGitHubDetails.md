This document provides detailed step-by-step instructions on forking GsDevKit, cloning to 
your local server, creating a branch, and how to commit and update.  
Github and git provide many options and this is not the only way to perform these tasks; these instructions
are provided as a convenience for people getting started with github. 

###Clone gsDevKitHome
Clone the [gsDevKitHome project][2] to your GemStone development server and create a 
unique branch to keep any changes you make for your project isolated from the Dev Kit master branch:

The recommended process is:
  1. Create a github account, if needed, and log in.
  2. Fork the GsDevKit project on github.
  3. On your local GemStone development server, clone your GsDevKit fork. 
```Shell
git clone git@github.com:<yourAccountName>/gsDevKitHome.git  
```
  4. Create a unique branch for your work, and synchronize github
```Shell
cd gsDevKitHome
git checkout -b  <your_branch_name>
git push origin <your_branch_name>
```  
  5. On github, set the default branch for your account to your new branch. 
https://github.com/<yourAccountName>/gsDevKitHome/settings

You may clone using https://github.com/GsDevKit/gsDevKitHome.git, but this creates issues later.

These instructions do not cover all you need to know about git, but a few tips: 
To commit changes in the local checkout to the github branch:
```
git commit -a -m "checkin comment"
git push origin <your_branch_name>
```
To update my local checkout from the github branch:
```
git pull origin <your_branch_name>
```

See the documentation on [Git Credentials and tODE][97] for more information.

*Note, if you already have a [GitHub][15] account, before performing the clone, you should [fork the Dev Kit project][3] first. If you find and correct any issues with GsDevKit, this will make sharing these corrections much easier.*
