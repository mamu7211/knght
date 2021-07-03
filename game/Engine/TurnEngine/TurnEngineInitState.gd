extends AbstractState
class_name TurnEngineInitState


var initialized : bool = false

func start(old_state, new_params = {}):
	.start(old_state, new_params)
	initialized = false
	parent.turn = 1
	# TODO
	initialized = true


func get_next_state():
	if initialized:
		return build_return_state("StartTurn")
	return .next_state()
