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

if [ "$1x" = "x" ] ; then
  echo "createStone.sh <stone-name> <gemstone version (e.g., 3.1.0.1)>"
  exit 1
fi 
if [ "$2x" = "x" ] ; then
  echo "createStone.sh <stone-name> <gemstone version (e.g., 3.1.0.1)>"
  exit 1
fi 
stoneName="$1"
vers="$2"

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi
echo "Creating $stoneName for GemStone $vers"

stoneDir="$GS_HOME/gemstone/stones/$stoneName"
#    Create the stone directory
if [ ! -e $stoneDir ]; then
  mkdir $stoneDir
else
  echo "[Warning]  $GS_HOME/gemstone/stones/$stoneName already exists"
  echo "to replace it, remove or rename it and rerun this script"
  exit 0
fi

#    Create link to the selected gemstone/products/$gs_vers directory 
# Detect operating system
PLATFORM="`uname -sm | tr ' ' '-'`"
# Macs with Core i7 use the same software as older Macs
[ $PLATFORM = "Darwin-x86_64" ] && PLATFORM="Darwin-i386"
# Check we're on a suitable 64-bit machine and set gsvers
case "$PLATFORM" in
    Darwin-i386)
    gsvers="GemStone64Bit${vers}-i386.Darwin"
    ;;
    Linux-x86_64)
    gsvers="GemStone64Bit${vers}-x86_64.Linux"
    ;;
    *)
    echo "[Error] This script only works on a 64-bit Linux or Mac OS X machine"
    echo "The result from \"uname -sm\" is \"`uname -sm`\""
    exit 1
    ;;
esac

if [ ! -e $GS_HOME/gemstone/products/$gsvers ]; then
  echo "[Error] the specified product directory: $gsvers does not exist"
  exit 1
fi

ln -sf $GS_HOME/gemstone/products/$gsvers $stoneDir/product
 
#    Create backups directory
mkdir  $stoneDir/backups

#    Create bin directory
mkdir  $stoneDir/bin

#    Create extents directory
mkdir  $stoneDir/extents
cp $GS_HOME/gemstone/products/$gsvers/seaside/data/extent0.dbf $stoneDir/extents
cp $GS_HOME/gemstone/templates/system.conf $stoneDir/extents

#    Create logs directory
mkdir  $stoneDir/logs

#    Create stats directory
mkdir  $stoneDir/stats

#    Create tranlogs directory
mkdir  $stoneDir/tranlogs

#    Copy stone-specific conf files
cp $GS_HOME/gemstone/templates/stone.env $stoneDir
cp $GS_HOME/gemstone/templates/gem.conf $stoneDir
cp $GS_HOME/gemstone/templates/maint.conf $stoneDir

# End of script
exit 0
