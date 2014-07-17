#! /bin/bash

#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - buildTodeClientImage.sh
#
# Purpose - build the tODE client image
#
#=========================================================================

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi
echo "Building tODE client image"

# build tODE client

cd $GS_HOME/dev/tode/client/image
pharo=$GS_HOME/pharo
$pharo/pharo $pharo/Pharo.image save tode
$pharo/pharo $pharo/tode.image config \
	filetree://$GS_HOME/repository \
	ConfigurationOfTodeClient \
	--group="'GemStone Dev'" \
	--install=release

# End of script
exit 0
