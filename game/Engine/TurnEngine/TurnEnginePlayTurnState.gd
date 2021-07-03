extends AbstractState
class_name TurnEnginePlayTurnState

var turn_finished = false

func start(old_state, new_params = {}):
	.start(old_state, new_params)
	# TODO
	turn_finished = true


func get_next_state():
	if turn_finished:
		return build_return_state("EndTurn")
	return null
