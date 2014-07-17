versions
version001: spec
	<version: '0.0.1'>
	spec
		for: #pharo
		do: [ 
			spec
				baseline: 'Tode' with: [ spec repository: 'github://dalehenrich/tode:master/repository' ];
				import: 'Tode ' ]