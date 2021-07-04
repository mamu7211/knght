extends AbstractState
class_name TurnEngineNextTurnState

func start(old_state, new_params={}):
	.start(old_state, new_params)
	parent.turn += 1
