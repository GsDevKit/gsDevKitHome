#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

$GS_HOME/bin/createTodeImage

. $GS_HOME/bin/defStone.env ${STONENAME1}

# test $GEMSTONE/seaside/bin/bootstrapGLASS script
stoneNewExtent -s $baseSnapshot ${STONENAM1} $GS_VERSION

$GEMSTONE/seaside/bin/bootstrapGLASS

#test $GEMSTONE/seaside/bin/runBackup

export GEMSTONE_DATADIR=$GS_HOME/gemstone/stones/${STONENAM1}
$GEMSTONE/seaside/bin/runBackup
ls ${GEMSTONE_DATADIR}/backups

stopStone -b ${STONENAME1}

stoneNewExtent -s $seasideSnapshot ${STONENAM1} $GS_VERSION

stopStone -b ${STONENAME1}

echo "$0 DONE"
