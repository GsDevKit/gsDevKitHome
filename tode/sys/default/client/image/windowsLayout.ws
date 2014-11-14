"choose TDStandardWindowProperties or 
 TDAlternateWindowProperties class for different layouts.
 Adjust parameters to change  proportions or configuration of 
 layout. "
| layoutName sessionDescriptionName propertiesClass |
"TDShell gsDevKitRoot:'/opt/git/gsDevKitHome/'"
layoutName := 'custom'.
sessionDescriptionName := 'gsDevKit'.
propertiesClass := TDStandardWindowProperties.
(propertiesClass new
  margin: 3 @ 3;			"inset from edges of display"
  codeWidthFactor: 0.45;	"% of width devoted to code window"
  extraLists:2 ;				"number of extra lists"
  shellHeightFactor: 0.33;	"% of height devoted to shell window"
  topHeightFactor: 0.25;	"% of height devoted to top windows"
  yourself) 
    exportTo: TDShell windowLayoutHome, layoutName.
TDAbstractWindowProperties install: layoutName.
TDShell testWindowLayout: sessionDescriptionName.

"TDTopezGemStoneClient windowProperties"
