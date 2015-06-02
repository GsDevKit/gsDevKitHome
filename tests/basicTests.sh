#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

gsdevkitSysSetup=$GS_HOME/bin/.gsdevkitSysSetup # if file exists, system setup alrady completed

if [ -e "$gsdevkitSysSetup" ]; then
  echo "Skip running osPrereqs, system already setup ($gsdevkitSysSetup exists)"
else
  # install OS prereqs which includes gdb, which should give us a C stack for 
  # bug 44491
  $GS_HOME/bin/osPrereqs
fi

# install server
installServer ${STONENAME1} $GS_VERSION
cd $GS_HOME/tode/sys/stones/${STONENAME1}
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
stoneNewExtent -h
stones -h
stopNetldi -h
stopStone -h
$GS_HOME/bin/tode -h   # apparently '.' is in the PATH
todeClient -h
updateTodeImage -h
# functions
createTodeImage -p _small

stones

# backup travis travis.dbf
# restoreFromBackup travis travis.dbf

stopStone ${STONENAME1}
stopNetldi ${STONENAME1}
updateTodeImage ${STONENAME1}
startStone ${STONENAME1}
stopStone ${STONENAME1}
stopNetldi ${STONENAME1}

stones

$GS_HOME/bin/pharo --list
$GS_HOME/bin/tode --list

stopStone ${STONENAME1}
stopNetldi ${STONENAME1}

createStone ${STONENAME2} $GS_VERSION
stoneNewExtent ${STONENAME2}

installServer ${STONENAME3} $GS_VERSION
cd $GS_HOME/tode/sys/stones/${STONENAME3}
ls dirs.ston  home  homeComposition.ston  packages.ston  projectComposition.ston  projects  repos.ston
performTodeCommand ${STONENAME3} eval \`3+4\`\; eval \`self == 7 ifFalse: [ System logout ]\`
performTodeCommand ${STONENAME3} ls /home

stopStone ${STONENAME2}
stopNetldi ${STONENAME2}
stopStone ${STONENAME3}
stopNetldi ${STONENAME3}

. $GS_HOME/bin/defStone.env ${STONENAME1}
cd $GS_HOME/gemstone/stones/${STONENAME1}
. defStone.env

echo "$0 DONE"
