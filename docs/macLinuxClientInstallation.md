   ```Shell
   # clone
   git clone git@github.com:<your github id>/gsDevKitHome.git
   cd gsDevKitHome
   git checkout <your branch name>
   # set up bash environment (add to .bashrc, too)
   export GS_HOME=`pwd`
   export PATH=$GS_HOME/bin:$PATH
   # install client artifacts (skip stone creation steps)
   installClient 3.2.1
   # launch todeClient and test stone login
   todeClient
   ```

