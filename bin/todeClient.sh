#! /bin/bash

#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - todeClient.sh 
#
# Purpose - launch todeClient image
#
# Examples
#   todeClient.sh
#
#=========================================================================

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi
if [ ! -e "$GS_HOME/pharo/pharo" ]; then
  $GS_HOME/bin/installPharo.sh
fi

# Run script
pharo=$GS_HOME/pharo
$pharo/pharo-ui $pharo/todeClient.image &

# End of script
exit 0
