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

stopStone -b ${STONENAME1}

echo "$0 DONE"
