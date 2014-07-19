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

# build tODE client
pharo=$GS_HOME/pharo
if [ -e $pharo/todeClient.image ] ; then
  echo "todeClent already installed"
  exit 0
fi

echo "building todeClient image"

$pharo/pharo $pharo/Pharo.image save todeClientTmp
$pharo/pharo $pharo/todeClientTmp.image eval --save "Gofer new package: 'ConfigurationOfTodeClient'; repository: (MCFileTreeRepository new directory: '$GS_HOME/repository' asFileReference); load"
$pharo/pharo $pharo/todeClientTmp.image config \
	filetree://$GS_HOME/repository \
	ConfigurationOfTodeClient \
	--install=release
if [[ $? != 0 ]] ; then
  echo "buildTodeImage.sh[Error]: failed loading tode client"
  exit 1
fi

$pharo/pharo $pharo/todeClientTmp.image save todeClient
if [[ $? != 0 ]] ; then
  echo "buildTodeImage.sh[Error]: failed saving tode client"
  rm -f todeClient*
  exit 1
fi

rm -f todeClientTmp.*
echo
echo "tODE client image build complete"

# End of script
exit 0
