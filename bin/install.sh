#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - install.sh
#
# Purpose - Install GemStone (specified gs-version), Pharo, build tODE client
#           image, create a stone (specifed stone-name), start the stone
#           start the netldi, install tODE on server and launch the tODE
#           client.
#
# Examples
#   install.sh 3.2.1 gsDevKit
#   install.sh 3.2.1 
#
#=========================================================================

if [ "$1x" = "x" ] ; then
  echo "install.sh <gs-version> [ <stone-name> ]"
  exit 1
fi
gsvers="$1"
stoneName="gsDevKit"

if [ "$2x" != "x" ] ; then
  stoneName="$2"
fi

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi

$GS_HOME/bin/installGemStone.sh $gsvers
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/buildTodeImage.sh
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/createStone.sh $stoneName $gsvers
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/startStone.sh $stoneName
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/startnetldi.sh $stoneName
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/installTodeStone.sh $stoneName
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/todeClient.sh

# End of script
exit 0
