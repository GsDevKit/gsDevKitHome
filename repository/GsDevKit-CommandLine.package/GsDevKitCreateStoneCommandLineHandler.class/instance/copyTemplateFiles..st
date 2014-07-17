actions
copyTemplateFiles: stoneDirectory
	| templateDir |
	templateDir := self templateHome.
	self templateFiles do: [ :fileName | templateDir / fileName copyTo: stoneDirectory / fileName ]