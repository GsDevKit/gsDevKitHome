#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - startnetldi.sh
#
# Purpose - start the netldi process for the named stone
#
# Examples
#   startnetldi.sh gsDevKit
#
#=========================================================================

if [ "$1x" = "x" ] ; then
  echo "startStone.sh <stone-name>"
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

netldiArgs=`$GS_HOME/bin/tode.sh netldiArgs`
# start the netldi process
$stonePath/product/bin/startnetldi $netldiArgs

# End of script
exit 0
