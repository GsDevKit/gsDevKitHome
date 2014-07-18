#=========================================================================
# Copyright (c) 2014 GemTalk Systems, LLC <dhenrich@gemtalksystems.com>.
#
# Name - installTodeStone.sh
#
# Purpose - install tODE in the given stone
#
# Examples
#   installTodeStone.sh gsDevKit
#
#=========================================================================

if [ "$1x" = "x" ] ; then
  echo "installTodeStone.sh <stone-name>"
  exit 1
fi
stoneName=$1

if [ "${GS_HOME}x" = "x" ] ; then
  echo "the GS_HOME environment variable needs to be defined"
  exit 1
fi

# set up stone environment
stonePath=$GS_HOME/gemstone/stones/$stoneName
pushd $stonePath >& /dev/null
source $stonePath/stone.env
popd $stonePath >& /dev/null

# install tode
$GS_HOME/bin/tode.sh installTode $stoneName

# End of script
exit 0
