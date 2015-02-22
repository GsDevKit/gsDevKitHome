#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

$GS_HOME/bin/installGemStone $GS_VERSION

$GS_HOME/bin/createTodeImage

$GS_HOME/bin/createTodeProjectStone projects $GS_VERSION crypto

$GS_HOME/bin/installTodeProjectStone projects SIXX

$GS_HOME/bin/installTodeProjectStone projects NewJSON

$GS_HOME/bin/installTodeProjectStone projects Mapless

$GS_HOME/bin/installTodeProjectStone projects Flow

stopStone projects
