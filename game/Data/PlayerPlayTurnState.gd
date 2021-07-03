extends AbstractState
class_name PlayerPlayTurnState


var initialized : bool = false


func start(old_state, new_params = {}):
	.start(old_state, new_params)
	initialized = false
	# TODO


func process(delta:float):
	.process(delta)
	if running_since > 1.0:
		initialized = true


func get_next_state():
	if initialized:
		return build_return_state("EndTurn")
	
	return .get_next_state()
