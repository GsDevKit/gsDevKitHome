Usage: createStone [ --help] <stone-name> <gs-version> [<snapshot-file-path>]
  <stone-name>          name of the stone to be created
  <gs-version>          GemStone version with which to create stone
  <snapshot-file-path>  If present, path to extent snapshot file to be used to
                        create the stone. If not specified,        
                        $GEMSTONE/bin/extent0.seaside.dbf is used.
	
Documentation:
Create a directory under $GS_HOME/gemstone/stones using the given
<stone-name> and populate directory with supporting files and directories
based on the given <gs-version> .

Examples:
    createStone --help
    createStone sample 3.2.4
    createStone sample 3.2.4 $GS_HOME/gemstone/snapshots/extent0.tode.3.2.4.dbf