#!/bin/bash
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

# Uncomment to use alternate version of tODE for tests
cp $GS_HOME/tests/tode/sys/default/server/scripts/installTode.ws $GS_HOME/tode/sys/default/server/scripts
cp $GS_HOME/tests/tode/sys/default/projects/tode.ston $GS_HOME/tode/sys/default/projects
cp $GS_HOME/tests/pharo/todeLoad.st $GS_HOME/pharo
cp $GS_HOME/tests/projects/magritte3/bin/installMagritteCommands.tode $GS_HOME/projects/magritte3/bin

case $TEST in
  Basic)
    $GS_HOME/tests/basicTests.sh
    ;;
  Magritte)
    $GS_HOME/tests/magritteTests.sh
    ;;
  Projects1|Projects2)
    $GS_HOME/tests/projectTests.sh
    ;;
  *)
    echo "Unknown test: $TEST"
    exit 1
    ;;
esac

