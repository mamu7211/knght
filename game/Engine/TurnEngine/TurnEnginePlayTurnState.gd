extends AbstractState
class_name TurnEnginePlayTurnState


var turn_finished = false


func start(old_state, new_params = {}):
	.start(old_state, new_params)
	turn_finished = false
	GameContext.select_first_player()


func end(_old_state, _new_state):
	for player in GameContext.players:
		player.set_state("Idle")


func process(delta:float):
	.process(delta)
	if GameContext.get_current_player().get_state() == "End":
		GameContext.select_next_player()
		if GameContext.is_valid_player():
			GameContext.get_current_player().set_state("PlayTurn")


func get_next_state():
	if not GameContext.is_valid_player():
		return build_return_state("EndTurn")
	
	return .get_next_state()
