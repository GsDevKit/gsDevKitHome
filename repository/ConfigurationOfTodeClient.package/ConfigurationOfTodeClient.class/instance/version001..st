versions
version001: spec
	<version: '0.0.1'>
	spec
		for: #'pharo3.x'
		do: [ 
			spec
				baseline: 'Tode'
					with: [ 
							spec
								loads: 'GemStone Dev';
								repository: 'github://dalehenrich/tode:master/repository' ];
				postLoadDoIt: #post30Load ]