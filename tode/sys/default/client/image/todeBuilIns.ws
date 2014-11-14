builtIns

restoreBackup /export/foos2/users/dhenrich/3.0/l_gss64bit/backups/otto.dbf

script --help
script --list
script --script=installTode
script --script=updateTode
script --script=updateClient

updateClient --help
updateClient --clientRepo=github://dalehenrich/tode:master
updateClient --clientRepo=github://dalehenrich/tode:master

updateServer --help
updateServer --clientScriptPath=scripts
