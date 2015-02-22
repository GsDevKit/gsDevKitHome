#!/bin/bash
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error
case $TEST in
  Basic)
    $GS_HOME/tests/basicTests.sh
    ;;
  *)
    echo "Unknown test: $TEST"
    exit 1
    ;;
esac

