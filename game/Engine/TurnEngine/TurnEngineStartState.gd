extends AbstractState
class_name TurnEngineStartState


var start_finished : bool = false


func start(old_state, new_params = {}):
	.start(old_state, new_params)
	start_finished = false


func process(delta:float):
	.process(delta)
	if running_since > 1.0:
		start_finished = true


func get_next_state():
	if start_finished:
		return build_return_state("PlayTurn")
	
	return .get_next_state()
