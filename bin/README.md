# GsDevKit Scripts
## Installation
| script | description |
|--------|-------------|
|[installClient][1]| Create a todeClient image on a remote machine. |
|installServer| Install GemStone/S, create a stone, start the stone, create a todeClient image on the GemStone server machine.|

## Stone Management
| script | description |
|--------|-------------|
|backup| Create a GemStone backup for the given stone.|
|createStone| Create a new stone with the given stone name. Do not install tODE.|
|createTodeStone| Create a new stone withe the given stone name with tODE installed.|
|defStone.env| Define GemStone environment variables in current shell (`source $GS_HOME/bin/defStone.env`).|
|restoreFromBackup|Restore a backup on the given stone.|
|startNetldi| Start the netldi process for the given stone.|
|startStatmonitor| Start the statmonitor processes for the given stone.|
|startStone| Start the stone process for the given stone.|
|stoneExtent| Copy a fresh extent to the given stone.|
|stones| List information about the installed GemStone/S produects, existing stones, running stones and running netldis.|
|stopStone| Stop the stone process for the given stone|
## tODE Client
| script | description |
|--------|-------------|
|createTodeImage| Create a new tODE client image.|
|todeClient| Run the tODE client image.|
|updateTodeImage| Update the tODE client image.|
## Utility
| script | description |
|--------|-------------|
|installGci| Copy the gci libraries for the given GemStone version to the $GS\_HOME/pharo directory. |
|installGemStone| Download and install the given GemStone version. Will make sure that shared memory is correctly configuration on your server. Performs some operations as `root` using sudo. |
|installPharo| Download and install Pharo3.0.|
|installTodeStone| Install tODE in the given stone.|
|pharo| Run command line version of stock Pharo3.0 image.|
|tode| Run  command line version of tODE client image.|

[1]: installClient
