#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

$GS_HOME/bin/installGemStone $GS_VERSION

$GS_HOME/bin/createTodeImage

$GS_HOME/projects/seaside31/bin/createSeaside3Stone seaside  $GS_VERSION

# Run Magritte unit tests
$GS_HOME/bin/tode todeIt seaside << EOF
test --batch project Seaside3
eval \`self hasPassed ifFalse: [ System logout ].\`
EOF
