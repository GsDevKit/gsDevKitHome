#! /bin/bash

#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - buildTodeImage.sh
#
# Purpose - build the tODE client image
#
# Examples
#   buildTodeImage.sh
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
$pharo/pharo $pharo/Pharo.image save todeClient
$pharo/pharo $pharo/todeClient.image eval --save "Gofer new package: 'ConfigurationOfTodeClient'; repository: (MCFileTreeRepository new directory: '$GS_HOME/repository' asFileReference); load"
$pharo/pharo $pharo/todeClient.image config \
	filetree://$GS_HOME/repository \
	ConfigurationOfTodeClient \
	--install=release

echo
echo "tODE client image build complete"

# End of script
exit 0
