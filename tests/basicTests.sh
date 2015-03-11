#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

# install server
installServer travis $GS_VERSION
cd $GS_HOME/tode/sys/stones/travis
ls dirs.ston  home  homeComposition.ston  packages.ston  projectComposition.ston  projects  repos.ston

stones

    # help
backup -h
createStone -h
createTodeImage -h
createTodeStone -h
installClient -h
installGci -h
installGemStone -h
installPharo -h
installServer -h
installTodeStone -h
$GS_HOME/bin/pharo -h  # apparently '.' is in the PATH
restoreFromBackup -h
startNetldi -h
startStatmonitor -h
startStone -h
stoneExtent -h
stones -h
stopStone -h
$GS_HOME/bin/tode -h   # apparently '.' is in the PATH
todeClient -h
updateTodeImage -h
# functions
createTodeImage -p _small

stones

# backup travis travis.dbf
# restoreFromBackup travis travis.dbf

stopStone travis
updateTodeImage travis
startStone travis
stopStone travis

stones

$GS_HOME/bin/pharo --list
$GS_HOME/bin/tode --list

stopStone travis

createStone travis_2 $GS_VERSION
stoneExtent travis_2

installServer travis_3 $GS_VERSION
cd $GS_HOME/tode/sys/stones/travis_3
ls dirs.ston  home  homeComposition.ston  packages.ston  projectComposition.ston  projects  repos.ston
performTodeCommand travis_3 eval \`3+4\`\; eval \`self == 7 ifFalse: [ System logout ]\`
performTodeCommand travis_3 ls /home
stopStone travis_3

. $GS_HOME/bin/defStone.env travis
cd $GS_HOME/gemstone/stones/travis
. defStone.env
