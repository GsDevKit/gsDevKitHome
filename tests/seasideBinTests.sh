#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

$GS_HOME/bin/createTodeImage


# test $GEMSTONE/seaside/bin/bootstrapGLASS script
createStone -s $baseSnapshot ${STONENAME1} $GS_VERSION

. $GS_HOME/bin/defStone.env ${STONENAME1}

$GEMSTONE/seaside/bin/bootstrapGLASS

#test $GEMSTONE/seaside/bin/runBackup

export GEMSTONE_DATADIR=$GS_HOME/gemstone/stones/${STONENAME1}
$GEMSTONE/seaside/bin/runBackup
ls ${GEMSTONE_DATADIR}/backups

stopStone -b ${STONENAME1}

echo "$0 DONE"
