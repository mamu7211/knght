extends AbstractState
class_name TurnEngineNextTurnState

var next_finished : bool = false

func start(old_state, new_params = {}):
	.start(old_state, new_params)
	next_finished = false
	# TODO
	parent.turn += 1
	next_finished = true


func get_next_state():
	if next_finished:
		return build_return_state("StartTurn")
