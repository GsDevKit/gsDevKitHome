#! /bin/bash

#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - createTodeStone.sh 
#
# Purpose - Create a new stone and install tODE
#
# Examples
#   createTodeStone.sh 3.2.1 gsDevKit
#   createTodeStone.sh gsDevKit
#
#=========================================================================

if [ "$1x" = "x" ] ; then
  echo "createTodeStone.sh <gs-version> [ <stone-name> ]"
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

$GS_HOME/bin/createStone.sh $stoneName $gsvers
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/startStone.sh $stoneName
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/startnetldi.sh $stoneName
if [[ $? != 0 ]] ; then exit 1; fi

$GS_HOME/bin/installTodeStone.sh $stoneName
if [[ $? != 0 ]] ; then exit 1; fi

# End of script
exit 0
