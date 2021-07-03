extends AbstractState
class_name TurnEngineNextTurnState

var next_finished : bool = false

func start(old_state, new_params = {}):
	.start(old_state, new_params)
	next_finished = false
	# TODO
	parent.turn += 1


func process(delta:float):
	.process(delta)
	if running_since > 1.0:
		next_finished = true


func get_next_state():
	if next_finished:
		return build_return_state("StartTurn")
	
	return .get_next_state()
