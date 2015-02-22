#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

$GS_HOME/bin/installGemStone $GS_VERSION

$GS_HOME/bin/createTodeImage

$GS_HOME/bin/createTodeProjectStone projects $GS_VERSION Flow

$GS_HOME/bin/installTodeProjectStone projects $GS_VERSION SIXX

stopStone projects
