#! /bin/bash

#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - installPharo.sh 
#
# Purpose - Automatically download and install a Linux, Mac or Windows
#           Pharo VM
#
#=========================================================================

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi
echo "Installing Pharo"

# Look for wget to download Pharo
if [ -e "`which wget`" ]; then
    cmd="`which wget`"
else
    echo "[Error] wget is not available. Install wget and rerun this script."
    exit 1
fi

# Download Pharo

cd $GS_HOME/pharo
wget -O- get.pharo.org/30+vmLatest | bash

# End of script
exit 0
