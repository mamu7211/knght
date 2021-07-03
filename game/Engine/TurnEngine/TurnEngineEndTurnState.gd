extends AbstractState
class_name TurnEngineEndTurnState


var end_finished = false

func start(old_state, new_params = {}):
	.start(old_state, new_params)
	end_finished = false


func process(delta:float):
	.process(delta)
	if running_since > 1.0:
		end_finished = true


func get_next_state():
	if GameContext.limit_turns and parent.turn >= GameContext.max_turns:
		return build_return_state("End")
		
	if end_finished:
		return build_return_state("NextTurn")
		
	return .get_next_state()
