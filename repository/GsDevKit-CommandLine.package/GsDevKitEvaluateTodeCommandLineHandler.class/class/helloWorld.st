examples
helloWorld
	"self helloWorld"

	| handler |
	handler := GsDevKitEvaluateTodeCommandLineHandler new stoneName: 'tode'.
	^ handler evaluate: 'eval `Transcript cr; show: ''hello world''`'