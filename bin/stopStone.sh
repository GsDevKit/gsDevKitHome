#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - stopStone.sh
#
# Purpose - stop the named stone
#
# Examples
#   stopStone.sh gsDevKit
#
#=========================================================================

if [ "$1x" = "x" ] ; then
  echo "stopStone.sh <stone-name>"
  exit 1
fi
stoneName=$1

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi

# set up stone environment
stonePath=$GS_HOME/gemstone/stones/$stoneName
pushd $stonePath
source $stonePath/stone.env
popd $stonePath

# stop the stone
$stonePath/product/seaside/bin/stopGemstone

# End of script
exit 0
