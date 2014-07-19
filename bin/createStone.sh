#! /bin/bash

#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - createStone.sh <stone-name> <gemstone-version>
#
# Purpose - Create a Gs Dev Kit stone for the given version of GemStone/S 64
#
# Description:
#    Create a directory under $GS_HOME/gemstone/stones using the given
#    <stone-name> and populate directory with supporting files and directories.
# 
# Examples     
#      createStone.sh --help
#      createStone.sh gsDevKit 3.2.1
#
# Actions:
#    Create the stone directory
#    Create link to the selected gemstone/products/$gs_vers directory 
#    Create backups directory
#    Create bin directory
#    Create extents directory
#    Create logs directory
#    Create stats directory
#    Create tranlogs directory
#    Copy stone-specific conf files
#=========================================================================

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi
if [ ! -e "$GS_HOME/pharo/pharo" ]; then
  $GS_HOME/bin/installPharo.sh
fi

echo "Creating stone $*"
# Run script
pharo=$GS_HOME/pharo
$pharo/pharo $pharo/todeClient.image createStone $*
if [[ $? != 0 ]] ; then exit 1; fi

# End of script
exit 0
